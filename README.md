# Shorty

Basic Url shortner app.

## Installation

In order to have this project working, you need to install MongoDB.

    brew install mongodb

To install the app

    git clone https://github.com/martinos/shorty.git

Go in the app directory

    cd shorty

Install dependencies

    bundle install

Configure the database

    bundle exec rake db:create

Run the app

    rails s
