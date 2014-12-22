<?lua local form = require "sailor.form" ?>
<h2>Update user</h2>
<?lua if saved == false then ?>
	There was an error while saving.
<?lua end ?>
<form method="post"> 
	<div class="form-group">
		<label>id:</label>
		<?lua page:print( form.text(user,'id', 'class="form-control" placeholder="id"') ) ?>
	</div>
	<div class="form-group">
		<label>username:</label>
		<?lua page:print( form.text(user,'username', 'class="form-control" placeholder="username"') ) ?>
	</div>
	<div class="form-group">
		<label>password:</label>
		<?lua page:print( form.text(user,'password', 'class="form-control" placeholder="password"') ) ?>
	</div>
	<div class="form-group">
		<label>email:</label>
		<?lua page:print( form.text(user,'email', 'class="form-control" placeholder="email"') ) ?>
	</div>
	<input type="submit" class="btn btn-primary"/>
</form>
<br/>
<a href="?r=user/index"><- Back to View All</a> 
