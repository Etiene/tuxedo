<h2>
	View post #<?lua page:print( post.id ) ?> 
	<small>(<a href="?r=post/update&id=<?lua page:print( post.id ) ?>" >update</a>)</small> 
	<small>(<a href="?r=post/delete&id=<?lua page:print( post.id ) ?>" >delete</a>)</small>
</h2>
<table class="table"> 
	<tr><td>id</td><td><?lua page:print( post.id ) ?> </td></tr> 
	<tr><td>author</td><td><?lua page:print( post.author.username ) ?> </td></tr> 
	<tr><td>creation date</td><td><?lua page:print( post.creation_date ) ?> </td></tr> 
	<tr><td>body</td><td><?lua page:print( post.body ) ?> </td></tr> 
	<tr><td>last modified</td><td><?lua page:print( post.last_modified ) ?> </td></tr> 
	<tr><td>published</td><td> <?lua if post.published then page:print( 'Yes' ) else page:print( 'No' ) end ?> </td> </tr>
</table> 
<br/>
<a href="?r=post/index"><- Back to View All</a>
