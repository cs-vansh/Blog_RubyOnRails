# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# rails db:seed to run
# default data for testing
user = User.where(email: "test@test").first_or_initialize
user.update!(
  password: "qwerty",
  password_confirmation: "qwerty"
)

100.times do |i|
  blog_post = BlogPost.where(title: "BlogPost #{i}").first_or_initialize
  blog_post.update(content: "Content #{i}", published_at: Time.current)
end
