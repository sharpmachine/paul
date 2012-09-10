xml.instruct!
xml.posts do
  @posts.each do |post|
    xml.post do
      xml.title post.title
      xml.content post.content
      xml.author "#{post.user.firstname} #{post.user.lastname}"
      xml.picture post.picture_url(:thumb)     
      xml.published_at post.updated_at
    end
  end
end