## Linguico Api


### ERD
![dbdiagram](https://user-images.githubusercontent.com/17970203/92890284-d410c180-f3cb-11ea-92c5-e5d8fa442480.png)


## API Documentation

The api documentation is Live at https://linguicoapi.docs.apiary.io/

### Live Version
[Click Here](#)

# Book an Appointment RESTful API

This is a backend-only project. Consists in an API REST for a car sale service. It allows the client app to offer the following workflow to the end user:

1. The user logs in the app, by typing his credentials: email and password. If the credentials are valid A token authorization is returned.
2. If the user is a student, he can make a request to view the teachers on the platform.
3. A user may choose to book an appointment with a teacher if they teach a language he/she would like to learn.
4. The user can access all their appointments, update and also delete appointments they no longer need.


## Built with

  * Ruby on Rails
  * Postgresql
  * Rspec
  * Shoulda matchers
  * Factory bot
  * Database cleaner
  * Faker
  * Bcrypt
  * JSON web token
  
## Prerequisites

  * Ruby: 2.7.0
  * Rails: 5.2.4
  * Postgres: >=9.5
  * API client like Postman or HTTPie

## Getting Started:

To get a local copy up and running follow these simple example steps:

1. Under the repository name, click the Clone or download green button.

2. Copy the URL given by clicking the clipboard button

3. Open a terminal window in your local machine and change the current directory to the one you
   want the clone directory to be made.

4. Type  git clone and the paste the URL you previusly copied to the clipboard

5. Change the current directory to the newly created folder

6. Install the ruby gems by running:

```
bundle install
```

7. Have postgres installed and start database by running this:

```
  sudo -u postgres psql
```
  (Exit postgres console with \q) 
  
8. Once you are done following the previous steps you should run:

```
rails db:create to create the local database.
rake db:migrate to run any pending migrations.
```

9. Start your web server:
```
   rails s
```
10. Login using postman on **localhost:3000/auth/login**

11. Read the documentation to know the way to make the requests properly

11. To run the automated unit tests use the following command:
```
   bundle exec rspec
```


 
## Show your support
Give a ⭐️ if you like this project!
 
## License
This project is [MIT](https://github.com/Flakster/Find-a-car-API/blob/api/LICENSE) Licensed

