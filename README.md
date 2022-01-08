# Taskority API
This is the backend repository for Taskority, a task manager to take charge of your tasks. Developed for CVWO assignment in 2021/2022, using Ruby on Rails and PostgreSQL.

The API is deployed on Heroku, and can be found [here](https://taskority-api.herokuapp.com/).

### API Endpoints
1. `/api/signup`
2. `/api/login`
3. `/api/users/:id`
4. `/api/tasks`
5. `/api/tasks/:id`

### Local Testing
You can test this API locally:
1. Clone this repository
```
git clone https://github.com/lesterong/cvwo-api.git
```
2. Navigate to directory
```
cd cvwo-api
```
3. Install dependencies
```
bundle install
```
4. Create and migrate the database
```
rails db:create
rails db:migrate
```
5. Update the origin in CORS to match the frontend domain
```ruby
# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://yourfrontend.domain.com'
    resource '/api/*',
      headers: %w(Authorization),
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      expose: %w(Authorization),
      max_age: 600
  end
end
```
6. Launch the API at http://localhost:8000/
```
rails server
```

### Tech Used
1. Ruby on Rails
2. PostgreSQL
3. Devise
4. Devise-JWT