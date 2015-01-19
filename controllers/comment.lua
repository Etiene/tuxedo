local M = {}

local function format_date(date)
	local _, _, y, m, d, h = string.find(date, "(%d+)-(%d+)-(%d+) (.+):%d+")
	return d.."/"..m.."/"..y.." "..h
end

function M.index(page)
	local access = require "sailor.access"
	if access.is_guest() then
		return 404
	end

	local comments = sailor.model("comment"):find_all()
	page:render('index',{comments = comments, format_date = format_date})
end


function M.update(page)
	local access = require "sailor.access"
	if access.is_guest() then
		return 404
	end

	local comment = sailor.model("comment"):find_by_id(page.GET.id)
	if not comment then
		return 404
	end
	local saved
	if next(page.POST) then
		comment:get_post(page.POST)
		if comment.approved == 'on' then
			comment.approved = true
		else
			comment.approved = false
		end
		saved = comment:update()
		if saved then
			page:redirect('comment/index')
		end
	end
	page:render('update',{comment = comment, saved = saved})
end

function M.view(page)
	local access = require "sailor.access"
	if access.is_guest() then
		return 404
	end
	local comment = sailor.model("comment"):find_by_id(page.GET.id)
	if not comment then
		return 404
	end
	comment.creation_date = format_date(comment.creation_date)
	page:render('view',{comment = comment})
end

function M.delete(page)
	local access = require "sailor.access"
	if access.is_guest() then
		return 404
	end
	local comment = sailor.model("comment"):find_by_id(page.GET.id)
	if not comment then
		return 404
	end

	if comment:delete() then
		page:redirect('comment/index')
	end
end

return M
