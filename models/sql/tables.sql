-- MySQL
drop table if exists user;
create table user(
	id int primary key auto_increment, 
	username varchar(20), 
	password varchar(64),
	email varchar(255),
	salt varchar(64)
);

drop table if exists post;
create table post(
	id int primary key auto_increment, 
	body text,
	author_id int references user (id) ON DELETE SET NULL,
	creation_date datetime,
	last_modified datetime,
	published boolean
);

drop table if exists comment;
create table comment(
	id int primary key auto_increment, 
	body text,
	creation_date datetime,
	approved boolean, 
	author_id int references user (id) ON DELETE SET NULL,
	post_id int references post (id) ON DELETE CASCADE
);

drop table if exists category;
create table category(
	id int primary key auto_increment, 
	name varchar(50),
	description text
);

drop table if exists post_category;
create table post_category(
	post_id int references post (id) ON DELETE CASCADE, 
	category_id int references category(id) ON DELETE CASCADE,
	primary key(post_id,category_id)
);