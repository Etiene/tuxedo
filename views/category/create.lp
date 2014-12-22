<?lua local form = require "sailor.form" ?>
<h2>Create category</h2>
<?lua if saved == false then ?>
	There was an error while saving.
<?lua end ?>
<form method="post"> 
	<div class="form-group">
		<label>name:</label>
		<?lua page:print( form.text(category,'name', 'class="form-control" placeholder="name"') ) ?>
		<span class="help-block"> <?lua page:print( category.errors.name or '') ?> </span>
	</div>
	<div class="form-group">
		<label>description:</label>
		<?lua page:print( form.textarea(category,'description', 'class="form-control" placeholder="description"') ) ?>
		<span class="help-block"> <?lua page:print( category.errors.description or '') ?> </span>
	</div>
	<input type="submit" class="btn btn-primary"/>
</form> 
<br/>
<a href="?r=category/index"><- Back to View All</a>
