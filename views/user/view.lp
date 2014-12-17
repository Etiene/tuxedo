<h2>
	View user #<?lua page:print( user.id ) ?> 
	<small>(<a href="?r=user/update&id=<?lua page:print( user.id ) ?>" >update</a>)</small> 
	<small>(<a href="?r=user/delete&id=<?lua page:print( user.id ) ?>" >delete</a>)</small>
</h2>
<table class="table"> 
	<tr><td>id</td><td><?lua page:print( user.id ) ?> </td></tr> 
	<tr><td>username</td><td><?lua page:print( user.username ) ?> </td></tr> 
	<tr><td>password</td><td><?lua page:print( user.password ) ?> </td></tr> 
	<tr><td>email</td><td><?lua page:print( user.email ) ?> </td></tr> 
</table> 
<br/>
<a href="?r=user/index"><- Back to View All</a>
