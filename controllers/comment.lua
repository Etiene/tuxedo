local M = {}

function M.index(page)
	local comments = sailor.model("comment"):find_all()
	page:render('index',{comments = comments})
end

function M.create(page)
	local comment = sailor.model("comment"):new()
	local saved
	if next(page.POST) then
		comment:get_post(page.POST)
		saved = comment:save()
		if saved then
			page:redirect('comment/index')
		end
	end
	page:render('create',{comment = comment, saved = saved})
end

function M.update(page)
	local comment = sailor.model("comment"):find_by_id(page.GET.id)
	if not comment then
		return 404
	end
	local saved
	if next(page.POST) then
		comment:get_post(page.POST)
		saved = comment:update()
		if saved then
			page:redirect('comment/index')
		end
	end
	page:render('update',{comment = comment, saved = saved})
end

function M.view(page)
	local comment = sailor.model("comment"):find_by_id(page.GET.id)
	if not comment then
		return 404
	end
	page:render('view',{comment = comment})
end

function M.delete(page)
	local comment = sailor.model("comment"):find_by_id(page.GET.id)
	if not comment then
		return 404
	end

	if comment:delete() then
		page:redirect('comment/index')
	end
end

return M
