
<style>
	.table td {
	    cursor: pointer;
	}
</style>
<h2>View all</h2>
<table class="table"> 
	<tr> 
		<th>id</th> 
		<th>author</th> 
		<th>creation date</th> 
		<th>body</th> 
		<th>last modified</th> 
		<th>published</th> 
	</tr>
	<?lua for k,v in pairs(posts) do ?>
		<tr onclick="location.href='<%= sailor.make_url('post/view',{id = v.id})%>'" > 
			<td> <?lua page:print( v.id ) ?> </td> 
			<td> <?lua page:print( v.author.username ) ?> </td> 
			<td> <?lua page:print( format_date(v.creation_date )) ?> </td> 
			<td> <?lua page:print( v.body ) ?> </td> 
			<td> <?lua page:print( format_date(v.last_modified )) ?> </td> 
			<td> <?lua if v.published then page:print( 'Yes' ) else page:print( 'No' ) end ?> </td> 
		</tr>
	<?lua end ?> 
</table> 
<br/>
<a href="<%= sailor.make_url('post/create')%>" class="btn btn-primary">Create new post</a>
