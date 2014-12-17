local comment = {}

-- Attributes and their validation rules
comment.attributes = {
	--<attribute> = { <valfunc> = {<args>}, <valfunc> = {<args>}...}
	{id = "safe"},
	{body = "safe"},
	{author_id = "safe"},
	{post_id = "safe"}

}

comment.db = {
	key = 'id',
	table = 'comment'
}

comment.relations = {
	post = {relation = "BELONGS_TO", model = "post", attribute = "post_id"},
	author = {relation = "BELONGS_TO", model = "user", attribute = "author_id"},
}

return comment

