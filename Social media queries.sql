use socialmedia;
-- 1.Retrieve a list of users along with their follower count from the followers table.
select user_id, followers as follower_count from followers order by user_id asc ;
-- 2.List all users who have saved posts
select * from saved_posts;
-- 3.Find all posts with their captions and like counts from the posts table.
select caption, likes_count from posts order by likes_count;
-- 4.Retrieve all messages sent by a specific user (e.g., sender_id = 5) from the messages table.
select message_content,sender_id from messages where sender_id=5;
-- 5.Find the users who has the 50 to 60 number of followers.
select user_id,followers from followers where followers between 50 and 60  order by followers desc;
-- 6.Find all notifications sent to a specific user (e.g., user_id = 7) .
select user_id,notification_content from notifications where user_id= 7;
-- 7.List the user who saved the post more then one.
select user_id,count(user_id) as post_count from saved_posts  group by user_id having count(user_id)>1;
-- 8.Retrieve all trending hashtags .
select hashtag_name,user_id from hashtag where is_trending="true";
-- 9. retrive the sender and receiver id where message status is read and the message type is text
select sender_id,receiver_id from messages where status="read" and message_type="text";
-- 10. retrive the sender and receiver id where message status is deleted or delivered
select count(sender_id),receiver_id,sender_id,message_content from messages where status in ("read","delivered")  group by sender_id,receiver_id,message_content having count(sender_id)>1;
-- 11.Find the top 5 most liked posts from the posts table.
select likes_count,post_id from posts order by likes_count desc limit 5;
-- 12.Find the average number of likes per post.
select round (avg( likes_count)) as  avg_likes_perpost from posts;
-- 13.Count the number of saved posts for each user 
select user_id,count(saved_post_id) from saved_posts group by user_id order by count(saved_post_id) desc;
-- 14.Retrieve all posts along with their associated hashtags 
select p.post_id,p.caption,h.hashtag_name from posts as p inner join hashtag as h on p.user_id=h.user_id order by post_id;
-- 15.Retrieve all posts along with the usernames of the users who created them
select p.post_id,u.user_name from users as u join posts as p on u.id=p.user_id order by post_id;
-- 16.List all saved posts along with the usernames of the users who saved them 
select s.user_id,s.post_id,u.user_name,p.caption,p.likes_count from saved_posts as s inner join users as u on s.user_id=u.id inner join posts as p on s.post_id=p.post_id order by user_id;
-- 17.Get all messages from the senders and their names 
select u.user_name,m.message_content,m.sender_id from users as u inner join messages as m where u.id=m.sender_id;
-- 18.Find users who have sent messages to the same receiver more than once
select m.sender_id,sender.user_name as sender_name,m.receiver_id, receiver.user_name as receiver_name,count(m.message_id) as total_messages
from messages as m
inner join users as sender on m.sender_id = sender.id
inner join users as receiver on m.receiver_id = receiver.id
group by m.sender_id, m.receiver_id, sender.user_name, receiver.user_name having count(m.message_id) > 1 order by total_messages desc;