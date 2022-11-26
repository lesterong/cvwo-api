# Taskority API
This is the backend repository for Taskority, a task manager to take charge of your tasks. Developed for CVWO assignment in 2021/2022, using Ruby on Rails and PostgreSQL.

The API is deployed on fly.io, and can be found [here](https://taskority-api.fly.dev/).

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
    git clone https://github.com/lesterong/taskority-api.git
    ```
2. Navigate to directory
    ```
    cd taskority-api
    ```
3. Install dependencies
    ```
    bundle install
    ```
4. Create and migrate the database. If you encounter an error when creating the database, you may have to generate a new [rake secret](#generating-a-new-rake-secret).
    ```
    rails db:create
    rails db:migrate
    ```
5. Update the origin in CORS to match the frontend domain
    ```ruby
    # config/initializers/cors.rb
    
    Rails.application.config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'https://yourfrontend.domain.com'
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

### Troubleshooting

#### Generating a new rake secret
1. Delete the existing `config/credentials.yml.enc` file if it exists.
2. Generate a new rake secret. Copy the hash
   ```
   rake secret
   ```
3. Create a credentials file and edit it. You can also use `EDITOR=nano` if you prefer.
   ```
   EDITOR=vim rails credentials:edit
   ```
4. Add the following into the credentials file, and save the file.
   ```
   devise:
     jwt_secret_key: <rake secret key> 
   ```
5. 
