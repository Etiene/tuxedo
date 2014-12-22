local user = {}
local val = require "valua"
-- Attributes and their validation rules
user.attributes = {
	--<attribute> = { <valfunc> = {<args>}, <valfunc> = {<args>}...}
	{id = "safe"},
	{username = val:new().not_empty() },
	{password = val:new().not_empty().len(6,64) },
	{salt = "safe" },
	{email = val:new().not_empty().email() }
}

user.db = {
	key = 'id',
	table = 'user'
}

user.relations = {
	posts = {relation = "HAS_MANY", model = "post", attribute = "author_id"},
	comments = {relation = "HAS_MANY", model = "comment", attribute = "author_id"}
}

return user
