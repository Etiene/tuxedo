local conf = {
	sailor = {
		app_name = 'Tuxedo! A blog system powered by Sailor MVC Framework in Lua',
		default_static = nil, -- If defined, default page will be a rendered lp as defined. 
							  -- Example: 'maintenance' will render /views/maintenance.lp
		default_controller = 'post', 
		default_action = 'index',
		layout = 'default',
		route_parameter = 'r',
		default_error404 = 'error/404',
		enable_autogen = true, -- default is false, should be true only in development environment
		friendly_urls = true,
	},
	db = {
		driver = 'mysql',
		host = 'localhost',
		user = '',
		pass = '',
		dbname = ''
	},
	smtp = {
		server = '',
		user = '',
		pass = '',
		from = ''
	},
	debug = {
		inspect = true
	},
	tuxedo = {
		posts_per_page = 10,
		auto_approve_comments = false
	}
}

return conf
