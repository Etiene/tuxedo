<h2>
	View comment #<?lua page:print( comment.id ) ?> 
	<small>(<a href="<%= sailor.make_url('comment/update',{id = comment.id})%>" >update</a>)</small> 
	<small>(<a href="<%= sailor.make_url('comment/delete',{id = comment.id})%>" >delete</a>)</small>
</h2>
<table class="table"> 
	<tr><td>id</td><td><?lua page:print( comment.id ) ?> </td></tr> 
	<tr><td>body</td><td><?lua page:print( comment.body ) ?> </td></tr> 
	<tr><td>creation date</td><td><?lua page:print( comment.creation_date ) ?> </td></tr> 
	<tr><td>author id</td><td><?lua page:print( comment.author_id ) ?> </td></tr> 
	<tr><td>post id</td><td><?lua page:print( comment.post_id ) ?> </td></tr> 
	<tr><td>approved</td><td><?lua if comment.approved then page:print( 'Yes' ) else page:print( 'No' ) end ?> </td></tr> 
</table> 
<br/>
<a href="<%= sailor.make_url('comment/index')%>"><- Back to View All</a>
