local category = {}
local val = require "valua"
-- Attributes and their validation rules
category.attributes = {
	--<attribute> = { <valfunc> = {<args>}, <valfunc> = {<args>}...}
	{ id = "safe" },
	{ name = val:new().not_empty().len(0,50) },
	{ description = "safe"}

}

category.db = {
	key = 'id',
	table = 'category'
}

category.relations = {
	posts = {relation = "MANY_MANY", model = "post", table = "post_category", attributes = {"cateogory_id","post_id"}}	
}

return category
