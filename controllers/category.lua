local M = {}

function M.index(page)
	local access = require "sailor.access"
	if access.is_guest() then
		return 404
	end
	local categories = sailor.model("category"):find_all()
	page:render('index',{categorys = categorys})
end

function M.create(page)
	local access = require "sailor.access"
	if access.is_guest() then
		return 404
	end
	local category = sailor.model("category"):new()
	local saved
	if next(page.POST) then
		category:get_post(page.POST)
		saved = category:save()
		if saved then
			page:redirect('category/index')
		end
	end
	page:render('create',{category = category, saved = saved})
end

function M.update(page)
	local access = require "sailor.access"
	if access.is_guest() then
		return 404
	end
	local category = sailor.model("category"):find_by_id(page.GET.id)
	if not category then
		return 404
	end
	local saved
	if next(page.POST) then
		category:get_post(page.POST)
		saved = category:update()
		if saved then
			page:redirect('category/view',{id = category.id})
		end
	end
	page:render('update',{category = category, saved = saved})
end

function M.view(page)
	local access = require "sailor.access"
	if access.is_guest() then
		return 404
	end
	local category = sailor.model("category"):find_by_id(page.GET.id)
	if not category then
		return 404
	end
	page:render('view',{category = category})
end

function M.delete(page)
	local access = require "sailor.access"
	if access.is_guest() then
		return 404
	end
	local category = sailor.model("category"):find_by_id(page.GET.id)
	if not category then
		return 404
	end

	if category:delete() then
		page:redirect('category/index')
	end
end

return M
