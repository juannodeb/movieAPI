# movieAPI

### How to use

1. Open your terminal.

2. Check if you have ruby installed with `ruby -v`.

   If not installed use for example `rvm install 2.5.1` or google more ways to install it

3. Choose whether you want to clone or download the repository

   ***Download:***

   Click on the Clone or download button
   Click on Download ZIP
   Choose where to save the repository
   Extract the downloaded folder

   ***Clone:***

   Check if you have git installed with `git --version`
   If not installed use for example `sudo apt-get install git` or google more ways to install it
   Click on the Clone or download button
   Copy the link given
   Go to the terminal and cd into the folder you will clone the app
   Use `git clone git@github.com:juannodeb/movieAPI.git`

   ***Run the app:***

   cd into the project folder
   `bundle install`
   `rails s`
   The app would use the 3001 port to work with the client side app made with React.js
   Go to `localhost:3001` in your preferred browser

   To run all the tests you have to use `bundle exec rspec` or any variation of it in case you want to run any specific test.


### About & Disclaimers

1. Made with ruby 2.5.1 and rails 6.0.3

2. Version 1.0 (Jan 2021)

3. Repository contains an still in progress RoR API project

4. Not all the functionality is fully tested nor the app is working as expected as of version 1 of the project


### Improvements

1. Finish MVP/full functionality of the project to work with the front side app
2. Add missing tests (currently only models are getting tested)
3. Refactor on the overall project

