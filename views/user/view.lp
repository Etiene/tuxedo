<h2>
	View user #<?lua page:print( user.id ) ?> 
	<small>(<a href="<%= sailor.make_url('user/update',{id = user.id})%>" >update</a>)</small> 
	<small>(<a href="<%= sailor.make_url('user/delete',{id = user.id})%>" >delete</a>)</small>
</h2>
<table class="table"> 
	<tr><td>id</td><td><?lua page:print( user.id ) ?> </td></tr> 
	<tr><td>username</td><td><?lua page:print( user.username ) ?> </td></tr> 
	<tr><td>email</td><td><?lua page:print( user.email ) ?> </td></tr> 
</table> 
<br/>
<a href="<%= sailor.make_url('user/index')%>"><- Back to View All</a>
