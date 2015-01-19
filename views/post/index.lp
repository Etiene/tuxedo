<div class="row">
    <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
    	<?lua
		for i=start,stop do 
			if not posts[i] then break end 

			local t = string.gsub(posts[i].title," ","-")?>
			<div class="post-preview">
            	<a href="<%= sailor.make_url('post/view',{id = posts[i].id, t = t})%>">
                	<h2 class="post-title">
						<%= posts[i].title %>
					</h2>
                    <h3 class="post-subtitle">
                        <%= posts[i].subtitle %>
                    </h3>
				</a>
            	<p class="post-meta">
            		Posted by <%= posts[i].author.username %> on <%= format_date(posts[i].creation_date) %><br/>
        			<a href="<%= sailor.make_url('post/view',{id = posts[i].id})%>"><%= #posts[i].comments %> comments</a>
        		</p>
        		<hr/>
            </div>
         
		<?lua end ?>

		<ul class="pager">
		<?lua if pages > 1 then
			for i=1,pages do ?>
				<li class="next">
					<a href="<%= sailor.make_url('post/view',{id = posts[i].id, t = t})%>"> <%= i %> </a> 
				</a>
				<?lua end 
			end ?>
        </ul>
    </div>
</div>