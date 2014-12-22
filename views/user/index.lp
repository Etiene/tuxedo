<style>
	.table td {
	    cursor: pointer;
	}
</style>
<h2>View all</h2>
<table class="table"> 
	<tr> 
		<th>id</th> 
		<th>username</th> 
		<th>email</th> 
	</tr>
	<?lua for k,v in pairs(users) do ?>
		<tr onclick="location.href='?r=user/view&id=<?lua page:print( v.id ) ?>'" > 
			<td> <?lua page:print( v.id ) ?> </td> 
			<td> <?lua page:print( v.username ) ?> </td> 
			<td> <?lua page:print( v.email ) ?> </td> 
		</tr>
	<?lua end ?> 
</table> 
<br/>
<a href="?r=user/create" class="btn btn-primary">Create new user</a>
