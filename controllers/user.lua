local M = {}
local session = require "sailor.session"
local access = require "sailor.access"

function M.index(page)
	local users = sailor.model("user"):find_all()
	page:render('index',{users = users})
end

function M.create(page)
	local user = sailor.model("user"):new()
	local saved
	if next(page.POST) then
		page:inspect(page.POST)
		user:get_post(page.POST)
		if user:validate() then 
			user.password = access.hash(user.username,user.password)

			saved = user:save()
			if saved then
				page:redirect('user/index')
			else
				user.password = ''
			end
		end
	end
	page:render('create',{user = user, saved = saved})
end

function M.update(page)
	local user = sailor.model("user"):find_by_id(page.GET.id)
	if not user then
		return 404
	end
	local pass = user.password
	user.password = ''
	local saved
	if next(page.POST) then
		user:get_post(page.POST)
		if not user.password or user.password == '' then 
			user.password = pass 
		else
			user.password = access.hash(user.username,user.password)
		end

		saved = user:update()
		if saved then
			page:redirect('user/view',{id = user.id})
		else
			user.password = ''
		end
	end
	page:render('update',{user = user, saved = saved})
end

function M.view(page)
	local user = sailor.model("user"):find_by_id(page.GET.id)
	if not user then
		return 404
	end
	page:render('view',{user = user})
end

function M.delete(page)
	local user = sailor.model("user"):find_by_id(page.GET.id)
	if not user then
		return 404
	end

	if user:delete() then
		page:redirect('user/index')
	end
end

function M.login(page)
	local user = sailor.model("user"):new()
	if next(page.POST) then
		user:get_post(page.POST)
		local login, err = access.login(user.username,user.password)
		page:inspect(login)

		if not login then
			user.errors.password = err
		end
	end
	page:render('login',{user = user})
end

function M.logout(page)
	access.logout()
	page:redirect('user/login')
end	

return M
