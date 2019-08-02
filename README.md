# README

### What is Eat & Greet?

Eat & Greet is a mealsharing app that connects you to fellow newcomers for a meal at local restaurants. It is designed for people who are new to an area and looking to make friends. The site currently supports Durham, Boulder, and Washington DC, the locations of Viget's 3 offices. You can check it out at [eatandgreet.us](https://eatandgreet.us/)

### Starting a local server
In order to run this on a local server:
1. Make sure you have postgres running
2. install all dependancies locally by running `bundle install` in the project repo
3. run `rake db:create` followed by `rake db:migrate`
4. get your local server started by running `rails s`

You may need to install ruby 2.6.3 beforehand with [homebrew](https://brew.sh/) and [these instructions](https://stackoverflow.com/questions/36485180/how-to-update-ruby-with-homebrew).

### Screenshots
![homepage](https://user-images.githubusercontent.com/37525354/62396899-57fa4800-b542-11e9-85eb-20ab2b713f18.png)
![browse](https://user-images.githubusercontent.com/37525354/62396914-5fb9ec80-b542-11e9-8ec7-3ac9140bc4a9.png)
![table](https://user-images.githubusercontent.com/37525354/62396933-634d7380-b542-11e9-8390-58251ebdac1a.png)
![user](https://user-images.githubusercontent.com/37525354/62396943-67799100-b542-11e9-9671-b033ed5896b9.png)
