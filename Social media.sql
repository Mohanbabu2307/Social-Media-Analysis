create database Socialmedia;
use socialmedia;
select * from users;
alter table users add primary key (id);
alter table users add unique (user_name(100), email(100));
alter table posts change column ï»¿post_id post_id int;
alter table posts add primary key (post_id);
alter table posts add foreign key (user_id) references users (id);
desc posts;
alter table comments change column ï»¿comment_id comment_id int;
alter table comments add primary key (comment_id); 
alter table comments add foreign key (user_id) references users (id);
alter table comments add foreign key (post_id) references posts (post_id);
select * from comments;
desc comments; 
alter table likes add primary key (like_id); 
alter table likes add foreign key (user_id) references users (id);
alter table likes add foreign key (post_id) references posts (post_id);
alter table followers add primary key (user_id); 
desc followers;
select * from followers;
alter table stories change column ï»¿story_id story_id int;
alter table stories add primary key (story_id);
alter table stories add foreign key (user_id) references users (id);
alter table messages add primary key (message_id);
alter table messages add foreign key (sender_id) references users (id);
alter table messages add foreign key (receiver_id) references users (id);
select * from messages;
alter table notifications add unique (notification_id);
alter table notifications add foreign key (notification_id) references users (id);
alter table hashtag add unique (Hashtag_id);
alter table hashtag add foreign key (user_id) references users (id);
alter table saved_posts add unique (saved_post_id);
alter table saved_posts add foreign key (user_id) references users (id);
alter table saved_posts add foreign key (post_id) references posts (post_id);

-- 1.Retrieve a list of users along with their follower count from the followers table.
SELECT user_id, followers AS follower_count FROM followers ORDER BY  user_id ASC ;



















