require 'faker'

 # Create a unique comment 
 post=Post.last
 post.comments.create(body:"This is a unique comment")

 # Create Posts
 50.times do
  newtitle = Faker::Lorem.sentence
  newbody = Faker::Lorem.paragraph
    Unless Post.exists?(:title => newtitle, :body => newbody)
      Post.create!(:title => newtitle, :body => newbody)
    end
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