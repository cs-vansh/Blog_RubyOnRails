class MoveBodyToActionText < ActiveRecord::Migration[8.0]
  def change
    # find_each works like each, buts instead performs the tasks on batch of entries instead of a single entry each time.
    BlogPost.all.find_each do |blog_post|
      blog_post.update(content: blog_post.body)
    end

    # remove body column from the blog_posts table
    remove_column :blog_posts, :body
  end
end
