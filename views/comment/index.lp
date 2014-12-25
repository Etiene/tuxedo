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
		<th>creation date</th> 
		<th>author id</th> 
		<th>post id</th> 
		<th>approved</th> 
	</tr>
	<?lua for k,v in pairs(comments) do ?>
		<tr onclick="location.href='<%= sailor.make_url('comment/view',{id = v.id})%>'" > 
			<td> <?lua page:print( v.id ) ?> </td> 
			<td> <?lua page:print( v.body ) ?> </td> 
			<td> <?lua page:print( format_date(v.creation_date) ) ?> </td> 
			<td> <?lua page:print( v.author_id ) ?> </td> 
			<td> <?lua page:print( v.post_id ) ?> </td> 
			<td> <?lua if v.approved then page:print( 'Yes' ) else page:print( 'No' ) end ?> </td> 
		</tr>
	<?lua end ?> 
</table> 
<br/>
<a href="<%= sailor.make_url('comment/create')%>" class="btn btn-primary">Create new comment</a>
