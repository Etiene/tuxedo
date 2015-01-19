<!-- POST -->
<?lua 
local form = require "sailor.form"
local t = string.gsub(post.title," ","-") ?>
<h2>
	<a href="<%= sailor.make_url('post/view',{id = post.id, t = t})%>">
		<%= post.title %>
	</a>
</h2>

<%= post.body %>
<br/><br/>
By <%= post.author.username %> on <%= post.creation_date %>
<br/>
<hr/>

<h4>Comments</h4>
<!-- INSERT COMMENT FORM -->
<?lua if comment_msg then page:print(comment_msg.."<br/>") end ?>
<form method="post"> 
	<div class="form-group">
		<label>Author:</label>
		<%= form.text(new_comment,'author', 'class="form-control" placeholder="your-name"')%><br/>
		<span class="help-block"> <?lua page:print( new_comment.errors.author or '') ?> </span>
	</div>
	<div class="form-group">
		<label>Email: (will not be public)</label>
		<%= form.text(new_comment,'email', 'class="form-control" placeholder="your-email"')%><br/>
		<span class="help-block"> <?lua page:print( new_comment.errors.email or '') ?> </span>
	</div>
	<div class="form-group">
		<label>Comment</label>
		<%= form.textarea(new_comment,'body', 'class="form-control" placeholder="comment"')%><br/>
		<span class="help-block"> <?lua page:print( new_comment.errors.body or '') ?> </span>
	</div>
	<input type="submit" class="btn btn-primary"/>
</form> 
<br/>
<hr/>
<!-- COMMENTS -->


<?lua for k,comment in pairs(post.comments) do 
	if comment.approved then ?>
		<strong><%= comment.author %> on <%= format_date(comment.creation_date) %></strong>
		<br/>
		<%= comment.body %> 
		<hr/>
<?lua end 
end ?>
