<?lua local form = require "sailor.form" ?>
<h2>Update post</h2>
<?lua if saved == false then ?>
	There was an error while saving.
<?lua end ?>
<form method="post"> 
	<div class="form-group">
		<label>author_id:</label>
		<?lua page:print( form.text(post,'author_id', 'class="form-control" placeholder="author_id"') ) ?>
	</div>
	<div class="form-group">
		<label>body:</label>
		<?lua page:print( form.textarea(post,'body', 'class="form-control" placeholder="body"') ) ?>
	</div>
	<div class="form-group">
		<label>published:</label>
		<?lua page:print( form.checkbox(post,'published', '', false, 'class="form-control" placeholder="published"') ) ?>
	</div>
	<input type="submit" class="btn btn-primary"/>
</form>
<br/>
<a href="?r=post/index"><- Back to View All</a> 
