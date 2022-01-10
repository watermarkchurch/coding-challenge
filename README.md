# WM Coding Challenge
Here is a completed version of the coding challenge. Below is instructions on how to get everything up and running.
<br />

1. Make sure you have installed Ruby v3.0.1
2. Install Bundler
  * `gem install bundler:2.2.17`
3. Install [node and NPM](https://nodejs.org/en/download/)
4. Using NPM, install Yarn
  * `npm install --global yarn`
5. Install node modules with yarn
  * `yarn install`
6. Initialize the database in rails
  * `rails db:migrate`
7. OPTIONAL: Populate the database
  * `rails db:seed`
8. To launch local server, run `rails server`
9. Navigate to http://localhost:3000

<br />

<ins>Original README.md below</ins>

<br />

This repository contains a template Rails app that has been pre-configured using
many of our favorite gems for development and testing.  We've already debugged
the configuration issues associated with a new rails app, to allow you to focus
on the actual thing we're trying to assess with this coding challenge.

You are not required to use this template to complete the coding challenge, and
it will not count against you whether you do or don't!  If you prefer to init
your own rails app from scratch be free!

## Getting Started

There are two ways to go about developing using this template, [using docker](#using-docker)
or [standard "rails s"](#using-standard-rails-s)

### Using Docker

1. [install Docker Desktop, following the Getting Started guide](https://www.docker.com/get-started).
2. run `docker compose up` in the root of the directory
3. Navigate to http://localhost:3000

### Using standard "Rails s"

1. Install Ruby version 3.0.1 or higher
  * Our developers use [rbenv](https://www.ruby-lang.org/en/documentation/installation/#rbenv) to install particular ruby
  versions, but you can install it [any way you'd like](https://www.ruby-lang.org/en/documentation/installation/)
2. install Bundler v2.2.17 or higher
  * `gem install bundler -v2.2.17`
3. Run `bundle install`
4. Install [node and NPM](https://nodejs.org/en/download/)
5. using NPM, install Yarn 
  * `npm install --global yarn`
6. run `bundle exec rails s`
7. Navigate to http://localhost:3000

## Running tests

use `bundle exec rspec` to run RSpec tests.  In this template there are no tests
yet, you'll have to add them!

You can also use [Guard](https://github.com/guard/guard) to automatically watch 
files and re-run tests whenever they change.  Do this with `bundle exec guard`.

## Submitting your code

If you chose to use this template for your coding challenge, please submit your
work by forking this repository and sending a pull request.

If you chose to create your own rails app from scratch, please submit your work
by creating a new git repository and emailing us a link to it.

## Hint

Your next step should probably be to use Rails' [scaffold generator](https://www.rubyguides.com/2020/03/rails-scaffolding/)
to generate your `Message` model and controllers.  
`bundle exec rails g scaffold Message`

## Checklist

- [x] The homepage (path `/`) SHALL present a list of messages from the database
- [x] The homepage SHALL provide a link to a form to upload a new message
- [x] The new message page SHALL accept a mp4 file upload
- [x] The new message page MAY accept an additional jpeg or PNG file upload as a thumbnail image
- [x] The new message page SHALL accept the following textual inputs:
  *  Title
  *  Description
- [x] The new message page SHALL allow associating the message to any number of tags.
- [x] New tags SHALL be created automatically upon submitting the new message form.
- [x] The new message page SHALL have a Submit button which creates the new message.
- [x] The new message page SHALL have a Cancel button which discards the new message.
- [x] The new message page SHALL validate that title exists, rejecting the submission if validation fails.
- [x] On validation failure, the new message page SHALL display an appropriate error message.
- [x] On validation success, the new message page SHALL redirect to the homepage. 
- [x] The homepage SHALL display the newly created message in the list upon successful submission
- [x] The homepage MAY display the thumbnail image alongside the newly created message as an HTML img tag
- [x] The homepage SHALL provide a link to edit the message 
- [x] The edit message page SHALL accept the following textual inputs:
  *  Title
  *  Description
- [x] The edit message page SHALL allow adding new tags to the message or deleting tags from the message.
- [x] New tags SHALL be automatically created when the edit form is submitted.
- [x] The edit message page MAY allow replacing the thumbnail image or mp4 video file
- [x] The edit message page SHALL have a Submit button which creates the new message.
- [x] The edit message page SHALL have a Cancel button which discards the in-progress edit.
- [x] The edit message page SHALL validate that title exists, rejecting the submission if validation fails.
- [x] On validation failure, the edit message page SHALL display an appropriate error message.
- [x] On validation success, the edit message page SHALL redirect to the homepage 
- [x] All HTML pages in the application SHOULD have a consistent style and use a grid system (e.g., Bootstrap, Flexbox, CSS grid)
- [x] The application SHALL expose an API endpoint to query messages from the database
- [x] The API query endpoint SHALL respond with the `application/json` content type
- [x] The API query endpoint SHALL accept the `?tag=` HTTP query parameter to filter messages by tag
- [x] When filtering messages by tag, the API query endpoint SHALL only include messages matching the provided tag
- [x] The API query endpoint’s response SHALL include the following in JSON format for each message:
  * Title
  * Description
  * Tag
  * URL 
- [x] The above URL SHALL cause the browser to play the uploaded MP4 video when copy-pasted out of the API response into the URL bar.
- [x] The API query endpoint’s response MAY include the following additional fields:
 * thumbnail image URL
- [x] The above thumbnail image URL, if included, SHALL result in an image being displayed when used as the “src” attribute in an HTML image element
- [x] The application MAY contain a suite of unit tests, and instructions on how to execute them.
  Note: these tests need not be exhaustive, but there should be at least 1.  You decide how many tests you want to include. 
