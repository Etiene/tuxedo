local M = {}

function M.index(page)
	local posts = sailor.model("post"):find_all()
	page:render('index',{posts = posts})
end

function M.create(page)
	local post = sailor.model("post"):new()
	local saved
	if next(page.POST) then
		post:get_post(page.POST)
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
		saved = post:update()
		if saved then
			page:redirect('post/index')
		end
	end
	page:render('update',{post = post, saved = saved})
end

function M.view(page)
	local post = sailor.model("post"):find_by_id(page.GET.id)
	if not post then
		return 404
	end
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
