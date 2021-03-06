# Car Mileager
Current Master Build: http://frozen-ravine-7926.herokuapp.com

[![Build Status](https://travis-ci.org/allistera/car_mileager.svg?branch=master)](https://travis-ci.org/allistera/car_mileager)

With more and more cars getting sold with mileage restrictions these days it can be hard to keep track your usage, and by going over this limit you can incur hefty fines. Car Mileager, an open source project aims to solve this issue, allowing users to easily visualise exactly how much mileage they have used, and have remaining. 
 
## Project Setup

Car Mileager is a Ruby on Rails application. to install it is as simple as:

    $ git clone https://github.com/allistera/car_mileager
    $ cd car_mileager
    $ bundle install

And to run:

    $ rails s

You will need to have rails installed. Various guides can be found accross the internet to do so. 

## Architecture

Car Mileager uses the following technologies:

* Ruby on Rails 
* Slim templating engine
* SQLite for testing and development
* PostgreSQL for production
* SCSS following BEM methodology
* Minitest

## Testing

Car Mileager uses out box MiniTest and Fixtures to keep it as light weight as possible. This is done on [purpose](https://twitter.com/AllisterAntosik/status/528168000898101248), sorry no rspec, factory girl or capybara

Controller, Integration, Model and Unit tests as well as Fixtures can be found in the /test directory.

## Deploying

Once Travis-CI has been ran the master branch will be deployed to Heroku automatically.

Note that although Car Mileager uses SQLite for development and testing, it is set up to use PostgreSQL in production.

## Contributing changes

- To simplify things the [GitHub Flow](https://guides.github.com/introduction/flow/index.html) Git workflow is used

## License

The MIT License (MIT)

Copyright (c) 2014 Allister Antosik

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
