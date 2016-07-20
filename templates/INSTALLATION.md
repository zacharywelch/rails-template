## Installation

Follow these steps to get started in development.

Clone the repository

    $ git clone git@cagit.careerbuilder.com:CorpAppsCB/my_app_name.git

Switch to the project's directory

    $ cd my_app_name

Then bundle

    $ bundle

Copy database.yml.sample as database.yml

    $ cp config/database.yml.sample config/database.yml

Copy secrets.yml.sample as secrets.yml

    $ cp config/secrets.yml.sample config/secrets.yml

Make sure all config files mentioned above are filled with the proper configuration data

Create the database

    $ rake db:create

Run the migrations

    $ rake db:migrate

Run the seeds

    $ rake db:seed

Run tests

    $ rspec spec
