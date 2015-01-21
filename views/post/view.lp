<!-- Page Header -->
<!-- Set your background image for this header on the line below. -->
<header class="intro-header" style="background-image: url('/<?lua if post.bg_img then page:print("pub/images/"..post.bg_img) else page:print(page.theme_path.."/img/home-bg.jpg") end ?>')">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <div class="post-heading">
                    <h1>
						<%= post.title %>
					</h1>
                    <h2 class="subheading"><%= post.subtitle %></h2>
                    <span class="meta">Posted by <%= post.author.username %> on <%= post.creation_date %></span>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- POST -->
<?lua 
local form = require "sailor.form"
local t = string.gsub(post.title," ","-") ?>

<article>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
				<%= post.body %>
			</div>
        </div>

		<hr/>
		<div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">

				<h2>Comments</h2>
				<!-- INSERT COMMENT FORM -->
				<?lua if comment_msg then page:print(comment_msg.."<br/>") end ?>
				<form method="post"> 
					<div class="form-group">
						<label>Author:</label>
						<%= form.text(new_comment,'author', 'class="form-control" placeholder="your-name"')%><br/>
						<span class="help-block"> <?lua page:print( new_comment.errors.author or '') ?> </span>
					</div>
					<div class="form-group">
						<label>Email: (will not be public)</label>
						<%= form.text(new_comment,'email', 'class="form-control" placeholder="your-email"')%><br/>
						<span class="help-block"> <?lua page:print( new_comment.errors.email or '') ?> </span>
					</div>
					<div class="form-group">
						<label>Comment</label>
						<%= form.textarea(new_comment,'body', 'class="form-control" placeholder="comment"')%><br/>
						<span class="help-block"> <?lua page:print( new_comment.errors.body or '') ?> </span>
					</div>
					<input type="submit" class="btn btn-primary"/>
				</form> 
				<br/>
				

				<!-- COMMENTS -->
				<?lua for k,comment in pairs(post.comments) do 
					if comment.approved then ?>
						<hr/>
						<strong><%= comment.author %> on <%= format_date(comment.creation_date) %></strong>
						<br/>
						<%= comment.body %> 
				<?lua end 
				end ?>
			</div>
        </div>
    </div>
</article>