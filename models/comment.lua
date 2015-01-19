local comment = {}
local val = require "valua"
-- Attributes and their validation rules
comment.attributes = {
	--<attribute> = { <valfunc> = {<args>}, <valfunc> = {<args>}...}
	{id = "safe"},
	{body = val:new().not_empty()},
	{creation_date = "safe"},
	{author = val:new().not_empty()},
	{email = val:new().not_empty().email()},
	{post_id = "safe"},
	{approved = "safe"}

}

comment.db = {
	key = 'id',
	table = 'comment'
}

comment.relations = {
	post = {relation = "BELONGS_TO", model = "post", attribute = "post_id"},
}

return comment

