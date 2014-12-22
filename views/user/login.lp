<?lua local access = require "sailor.access" 

if access.is_guest() then 
	local form = require "sailor.form" 
?>
	<h2>Login</h2>
	<?lua if saved == false then ?>
		There was an error while saving.
	<?lua 	page:inspect(user.errors)
		  end ?>
	<form method="post"> 
		<div class="form-group">
			<label>username:</label>
			<?lua page:print( form.text(user,'username', 'class="form-control" placeholder="username"') ) ?>
		</div>
		<div class="form-group">
			<label>password:</label>
			<?lua page:print( form.password(user,'password', 'class="form-control" placeholder="password"') ) ?>
			<span class="help-block"> <?lua page:print( user.errors.password or '') ?> </span>
		</div>
		<input type="submit" class="btn btn-primary"/>
	</form>

<?lua else ?>
	Hello, <%=access.data.username%>, you are logged in.
	<br/>
	<a href='?r=user/logout' class="btn btn-primary" >Logout</a>
<?lua end ?>