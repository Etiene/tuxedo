local M = {}

local function format_date(date)
	local _, _, y, m, d, h = string.find(date, "(%d+)-(%d+)-(%d+) (.+):%d+")
	return d.."/"..m.."/"..y.." "..h
end

function M.index(page)
	local posts = sailor.model("post"):find_all()
	page:render('index',{posts = posts,format_date=format_date})
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
	if not post then
		return 404
	end
	post.creation_date = format_date(post.creation_date)
	post.last_modified = format_date(post.last_modified)
	page:render('view',{post = post})
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
