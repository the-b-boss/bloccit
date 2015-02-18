require 'faker'

 # Create a post with a unique title and body
 Post.create!(title:"This is a unique title",body:"This is a unique body")

 # Create a unique comment 
 post=Post.last
 post.comments.create(body:"This is a unique comment")

 # Create Posts
 50.times do
   Post.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 posts = Post.all
 
 # Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end
 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"