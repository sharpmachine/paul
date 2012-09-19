atom_feed do |feed|
  feed.title("Paul Manwaring Blog Category: #{@category.name}")
  feed.description("Paul Manwaring's blog. Paul Manwaring is an author and conference speaker. He is on the senior leadership team at Bethel Church in Redding California. He leads Global Legacy, an apostolic relational network of revival leaders.")  
  feed.updated(@posts[0].updated_at) if @posts.length > 0

  @posts.each do |post|
    feed.entry(post) do |entry|
      entry.title(post.title)
      entry.content(post.content, :type => 'html')
      entry.link(post_url(post))  
      entry.published_at(post.published_at)            

      entry.author do |author|
        author.name("#{post.user.firstname} #{post.user.lastname}")
      end
    end
  end
end