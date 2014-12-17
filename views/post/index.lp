<style>
	.table td {
	    cursor: pointer;
	}
</style>
<h2>View all</h2>
<table class="table"> 
	<tr> 
		<th>id</th> 
		<th>author_id</th> 
		<th>creation_date</th> 
		<th>body</th> 
		<th>last_modified</th> 
		<th>published</th> 
	</tr>
	<?lua for k,v in pairs(posts) do ?>
		<tr onclick="location.href='?r=post/view&id=<?lua page:print( v.id ) ?>'" > 
			<td> <?lua page:print( v.id ) ?> </td> 
			<td> <?lua page:print( v.author_id ) ?> </td> 
			<td> <?lua page:print( v.creation_date ) ?> </td> 
			<td> <?lua page:print( v.body ) ?> </td> 
			<td> <?lua page:print( v.last_modified ) ?> </td> 
			<td> <?lua page:print( v.published ) ?> </td> 
		</tr>
	<?lua end ?> 
</table> 
<br/>
<a href="?r=post/create" class="btn btn-primary">Create new post</a>
