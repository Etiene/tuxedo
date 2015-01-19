local M = {}

local function format_date(date)
	local _, _, y, m, d, h = string.find(date, "(%d+)-(%d+)-(%d+) (.+):%d+")
	return d.."/"..m.."/"..y.." "..h
end

function M.index(page)
	local posts = sailor.model("post"):find_all(" published=1 ORDER BY creation_date DESC")
	local current_page = page.GET.page or 1
	local posts_per_page = 3
	local pages = math.ceil(#posts/posts_per_page)
	local start = (current_page-1)*posts_per_page + 1
	local stop = current_page*posts_per_page

	page:render('index',{posts = posts,format_date=format_date, pages = pages, start = start, stop = stop})
end

function M.create(page)
	local post = sailor.model("post"):new()
	local saved
	if next(page.POST) then
		post:get_post(page.POST)
		if post.published == 'on' then
			post.published = true
		else
			post.published = false
		end
		post.creation_date = os.date("%Y-%m-%d %X")
		post.last_modified = os.date("%Y-%m-%d %X")
		saved = post:save()
		if saved then
			page:redirect('post/index')
		end
	end
	page:render('create',{post = post, saved = saved})
end

function M.update(page)
	local post = sailor.model("post"):find_by_id(page.GET.id)
	if not post then
		return 404
	end
	local saved
	if next(page.POST) then
		post:get_post(page.POST)
		if post.published == 'on' then
			post.published = true
		else
			post.published = false
		end
		post.last_modified = os.date("%Y-%m-%d %X")
		saved = post:update()
		if saved then
			page:redirect('post/view',{id = post.id})
		end
	end
	page:render('update',{post = post, saved = saved})
end

function M.view(page)
	local post = sailor.model("post"):find_by_id(page.GET.id)
	if not post or not post.published then
		return 404
	end

	local new_comment = sailor.model("comment"):new()
	if(next(page.POST)) then
		new_comment:get_post(page.POST)
		new_comment.creation_date = os.date("%Y-%m-%d %X")
		new_comment.approved = true
		new_comment.post_id = post.id
		if new_comment:save() then
			-- cleaning form
			new_comment = sailor.model("comment"):new()
		end
	end

	post.creation_date = format_date(post.creation_date)
	post.last_modified = format_date(post.last_modified)
	

	page:render('view',{post = post,format_date=format_date,new_comment=new_comment})
end

function M.delete(page)
	local post = sailor.model("post"):find_by_id(page.GET.id)
	if not post then
		return 404
	end

	if post:delete() then
		page:redirect('post/index')
	end
end

return M
