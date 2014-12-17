<?lua local form = require "sailor.form" ?>
<h2>Create post</h2>
<?lua if saved == false then ?>
	There was an error while saving.
<?lua page:inspect(post.errors)
	end ?>
<form method="post"> 
	<div class="form-group">
		<label>author:</label>
		<?lua page:print( form.text(post,'author_id', 'class="form-control" placeholder="author_id"') ) ?>
		<span class="help-block"> <?lua page:print( post.errors.author_id or '') ?> </span>
	</div>
	<div class="form-group">
		<label>post:</label>
		<?lua page:print( form.textarea(post,'body', 'class="form-control" placeholder="body"') ) ?>
		<span class="help-block"> <?lua page:print( post.errors.body or '') ?> </span>
	</div>
	<div class="form-group">
		<label>publish:</label>
		<?lua page:print( form.checkbox(post, 'published', '', false, 'class="form-control" placeholder="published"') ) ?>
		<span class="help-block"> <?lua page:print( post.errors.published or '') ?> </span>
	</div>
	<input type="submit" class="btn btn-primary"/>
</form> 
<br/>
<a href="?r=post/index"><- Back to View All</a>
