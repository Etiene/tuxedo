<?lua local form = require "sailor.form" ?>
<h2>Create post</h2>
<?lua if saved == false then ?>
	There was an error while saving.
<?lua end ?>
<form method="post"> 
<div class="form-group">
		<label>id:</label>
		<?lua page:print( form.text(post,'id', 'class="form-control" placeholder="id"') ) ?>
		<span class="help-block"> <?lua page:print( post.errors.id or '') ?> </span>
	</div>
<div class="form-group">
		<label>author_id:</label>
		<?lua page:print( form.text(post,'author_id', 'class="form-control" placeholder="author_id"') ) ?>
		<span class="help-block"> <?lua page:print( post.errors.author_id or '') ?> </span>
	</div>
<div class="form-group">
		<label>creation_date:</label>
		<?lua page:print( form.text(post,'creation_date', 'class="form-control" placeholder="creation_date"') ) ?>
		<span class="help-block"> <?lua page:print( post.errors.creation_date or '') ?> </span>
	</div>
<div class="form-group">
		<label>body:</label>
		<?lua page:print( form.text(post,'body', 'class="form-control" placeholder="body"') ) ?>
		<span class="help-block"> <?lua page:print( post.errors.body or '') ?> </span>
	</div>
<div class="form-group">
		<label>last_modified:</label>
		<?lua page:print( form.text(post,'last_modified', 'class="form-control" placeholder="last_modified"') ) ?>
		<span class="help-block"> <?lua page:print( post.errors.last_modified or '') ?> </span>
	</div>
<div class="form-group">
		<label>published:</label>
		<?lua page:print( form.text(post,'published', 'class="form-control" placeholder="published"') ) ?>
		<span class="help-block"> <?lua page:print( post.errors.published or '') ?> </span>
	</div>
	<input type="submit" class="btn btn-primary"/>
</form> 
<br/>
<a href="?r=post/index"><- Back to View All</a>
