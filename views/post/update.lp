<?lua local form = require "sailor.form" ?>
<h2>Update post</h2>
<?lua if saved == false then ?>
	There was an error while saving.
<?lua end ?>
<form method="post"> 
<div class="form-group">
		<label>id:</label>
		<?lua page:print( form.text(post,'id', 'class="form-control" placeholder="id"') ) ?>
	</div>
<div class="form-group">
		<label>author_id:</label>
		<?lua page:print( form.text(post,'author_id', 'class="form-control" placeholder="author_id"') ) ?>
	</div>
<div class="form-group">
		<label>creation_date:</label>
		<?lua page:print( form.text(post,'creation_date', 'class="form-control" placeholder="creation_date"') ) ?>
	</div>
<div class="form-group">
		<label>body:</label>
		<?lua page:print( form.text(post,'body', 'class="form-control" placeholder="body"') ) ?>
	</div>
<div class="form-group">
		<label>last_modified:</label>
		<?lua page:print( form.text(post,'last_modified', 'class="form-control" placeholder="last_modified"') ) ?>
	</div>
<div class="form-group">
		<label>published:</label>
		<?lua page:print( form.text(post,'published', 'class="form-control" placeholder="published"') ) ?>
	</div>
	<input type="submit" class="btn btn-primary"/>
</form>
<br/>
<a href="?r=post/index"><- Back to View All</a> 
