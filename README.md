# Watermark Sermon App

A simple Rails application for posting Sermons.

## Prerequisites

* Ruby 3.3.5 (as specified in `.ruby-version`)
* SQLite3
* Bundler

## Setup

1. Clone the repository:

```bash
git clone git@github.com:watermarkchurch/coding-challenge.git
cd coding-challenge
```

2. Install dependencies:
```bash
bundle install
```

3. Set up the database:
```bash
bin/rails db:create db:migrate
```

## Running the Application

1. Start the Rails server and Tailwind CSS compiler:
```bash
bin/dev
```

2. Open your web browser and navigate to:
```
http://localhost:3000
```

The application will redirect you to the messages index page at `/messages`.

## Running Tests

The application includes both model and controller tests. To run the test suite:

```bash
bin/rails test
```

To run system tests:

```bash
bin/rails test:system
```

## Features

* Create, read, update, and delete messages
* Upload MP4 video files
* Upload thumbnail images (JPEG, PNG)
* Add title and description to messages
* Responsive design using Tailwind CSS

## Technology Stack

* Ruby on Rails 8.0
* SQLite3 (database)
* Tailwind CSS (styling)
* Active Storage (file uploads)
