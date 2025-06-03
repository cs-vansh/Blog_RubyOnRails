# Ruby on Rails Blog

A simple blog application built with Ruby on Rails.

## Features

- Create, edit, and delete blog posts
- Rich text editing with ActionText
- Cover image upload and management
- Publishing workflow (draft, scheduled, published)
- Pagination
- User authentication for admin users
- Responsive design

## Setup

1. Install dependencies
   ```
   bundle install
   yarn install
   ```

2. Setup the database
   ```
   rails db:create
   rails db:migrate
   
   rails db:seed  # Creates a test user(Author) and 100 blog entries
   ```

3. Start the server
   ```
   rails server
   ```

4. Access the application at `http://localhost:3000`

### Author Access
- Login at `/users/sign_in` with the credentials:
  - Email: test@test
  - Password: qwerty
- After login, you can create new posts, edit existing ones, and manage publication status

## Technologies Used

- **Ruby on Rails 8:** Web application framework
- **ActionText:** Rich text content creation and storage
- **ActiveStorage:** File upload and management
- **Pagy:** Lightweight pagination
- **Devise:** Authentication and user management
- **SQLite:** Database storage

## Future Scope

- Persistence of data using cloud storage services
- Comments and user interaction features
- Analytics dashboard
- Email notifications for new content
