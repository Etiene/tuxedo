<style>
	.table td {
	    cursor: pointer;
	}
</style>
<h2>View all</h2>
<table class="table"> 
	<tr> 
		<th>id</th> 
		<th>body</th> 
		<th>author_id</th> 
		<th>post_id</th> 
	</tr>
	<?lua for k,v in pairs(comments) do ?>
		<tr onclick="location.href='?r=comment/view&id=<?lua page:print( v.id ) ?>'" > 
			<td> <?lua page:print( v.id ) ?> </td> 
			<td> <?lua page:print( v.body ) ?> </td> 
			<td> <?lua page:print( v.author_id ) ?> </td> 
			<td> <?lua page:print( v.post_id ) ?> </td> 
		</tr>
	<?lua end ?> 
</table> 
<br/>
<a href="?r=comment/create" class="btn btn-primary">Create new comment</a>
