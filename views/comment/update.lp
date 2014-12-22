<?lua local form = require "sailor.form" ?>
<h2>Update comment</h2>
<?lua if saved == false then ?>
	There was an error while saving.
<?lua end ?>
<form method="post"> 
	<div class="form-group">
		<label>body:</label>
		<?lua page:print( form.textarea(comment,'body', 'class="form-control" placeholder="body"') ) ?>
	</div>
	<div class="form-group">
		<label>author id:</label>
		<?lua page:print( form.text(comment,'author_id', 'class="form-control" placeholder="author_id"') ) ?>
	</div>
	<div class="form-group">
		<label>post id:</label>
		<?lua page:print( form.text(comment,'post_id', 'class="form-control" placeholder="post_id"') ) ?>
	</div>
	<div class="form-group">
		<label>approved:</label>
		<?lua page:print( form.checkbox(comment,'approved', '', false, 'class="form-control" placeholder="approved"') ) ?>
	</div>
	<input type="submit" class="btn btn-primary"/>
</form>
<br/>
<a href="?r=comment/index"><- Back to View All</a> 
