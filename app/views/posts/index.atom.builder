atom_feed do |feed|
  feed.title("Paul Manwaring Blog")
  feed.updated(@posts[0].published_at) if @posts.length > 0

  @posts.each do |post|
    feed.entry(post) do |entry|
      entry.title(post.title)
      entry.content(post.content, :type => 'html')
      entry.picture(post.picture_url(:thumb))  
      entry.published_at(post.published_at)            

      entry.author do |author|
        author.name("#{post.user.firstname} #{post.user.lastname}")
      end
    end
  end
end