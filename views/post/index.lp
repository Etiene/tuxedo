<?lua
	for i=start,stop do 
		if not posts[i] then break end 

		local t = string.gsub(posts[i].title," ","-")?>

		<a href="<%= sailor.make_url('post/view',{id = posts[i].id, t = t})%>">
			<strong><%= posts[i].title %></strong>
		</a>
		<br/><br/>
		<%= posts[i].body %><br/><br/>
		By <%= posts[i].author.username %> on <%= format_date(posts[i].creation_date) %>
		<br/>
		<a href="<%= sailor.make_url('post/view',{id = posts[i].id})%>">
			<%= #posts[i].comments %> comments
		</a>
		<br/><br/>
		<hr/>
<?lua end
	if pages > 1 then
		for i=1,pages do ?>
			<a href="<%= sailor.make_url('post/view',{id = posts[i].id, t = t})%>"> <%= i %> </a> 
<?lua   end 
	end
?>
