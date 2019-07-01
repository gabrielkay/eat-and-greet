# README

### Starting a local server
In order to run this on a local server, make sure you have all dependancies installed locally by running `bundle install` in the project repo, and then get your local server started by running `rails s`.
You may need to install ruby beforehand with [homebrew](https://brew.sh/) and [these instructions](https://stackoverflow.com/questions/36485180/how-to-update-ruby-with-homebrew).

### Current status of routes
Currently, the default home page is the file `app/views/home/index.html.erb`. Right now it just has links to create an account, sign in, and log out, but it could become our splash page with a lot of copy info about the site. The new account, sign in, and edit account views are in `app/views/devise/registrations/` and `app/views/devise/sessions/`. To get to the events index, you need to navigate to http://localhost:3000/events/ and from that page, you should be able to access all possible pages logically by clicking links on the screen. Note that the events index will only show events in the signed_in user's current city. I've created events in Durham in Atlanta, so you could make accounts based in those cities, or any other city and create some new events of your own. All of the views related to events are in `app/views/events/`.
