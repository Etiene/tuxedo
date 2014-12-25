<h2>
	View category #<?lua page:print( category.id ) ?> 
	<small>(<a href="<%= sailor.make_url('category/update',{id = category.id})%>" >update</a>)</small> 
	<small>(<a href="<%= sailor.make_url('category/delete',{id = category.id})%>" >delete</a>)</small>
</h2>
<table class="table"> 
	<tr><td>id</td><td><?lua page:print( category.id ) ?> </td></tr> 
	<tr><td>name</td><td><?lua page:print( category.name ) ?> </td></tr> 
	<tr><td>description</td><td><?lua page:print( category.description ) ?> </td></tr> 
</table> 
<br/>
<a href="<%= sailor.make_url('category/index')%>"><- Back to View All</a>
