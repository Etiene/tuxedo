<?lua local form = require "sailor.form" ?>
<h2>Create comment</h2>
<?lua if saved == false then ?>
	There was an error while saving.
<?lua end ?>
<form method="post"> 
	<div class="form-group">
		<label>body:</label>
		<?lua page:print( form.textarea(comment,'body', 'class="form-control" placeholder="body"') ) ?>
		<span class="help-block"> <?lua page:print( comment.errors.body or '') ?> </span>
	</div> 
	<div class="form-group">
		<label>author id:</label>
		<?lua page:print( form.text(comment,'author_id', 'class="form-control" placeholder="author_id"') ) ?>
		<span class="help-block"> <?lua page:print( comment.errors.author_id or '') ?> </span>
	</div>
	<div class="form-group">
		<label>post id:</label>
		<?lua page:print( form.text(comment,'post_id', 'class="form-control" placeholder="post_id"') ) ?>
		<span class="help-block"> <?lua page:print( comment.errors.post_id or '') ?> </span>
	</div>
	<div class="form-group">
		<label>approved:</label>
		<?lua page:print( form.checkbox(comment,'approved','',false, 'class="form-control" placeholder="approved"') ) ?>
		<span class="help-block"> <?lua page:print( comment.errors.approved or '') ?> </span>
	</div>
	<input type="submit" class="btn btn-primary"/>
</form> 
<br/>
<a href="<%= sailor.make_url('comment/index')%>"><- Back to View All</a>
