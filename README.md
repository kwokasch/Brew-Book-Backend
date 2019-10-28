"Brew Book App" - Back-End

"Brew Book" is a full-stack web application that allows users to generate an online review database for beers. The app utilizes the "BreweryDB" API to allow users to search for beers on the API. Users can also search the app's database to view beers, and can add beers to the database if they don't yet exist. 

PREREQUISITES & INSTALLATION Fork and clone these repositories from GitHub at https://github.com/kwokasch/Brew-Book-Frontend and https://github.com/kwokasch/Brew-Book-Backend. Open both files using the code editor of your choice.

Please consult the README.md in the "Brew-Book-Frontend" repository for instructions related to the front-end setup. 

In order to access the BreweryDB API, users will need to signup on the website and obtain an API key: https://www.brewerydb.com/signup. Once a key has been generated, users will need to copy that key into a .env file in order to secure the key. An example of the .env file has been included in the file tree for this repo ".env.example". Within this example file, users can replace the "fake" key that currently follows the equals (=) sign with their personal key. After the user's key has been pasted into this file, the user should change the name of the file to ".env". The ".env" file has been included in the ".gitignore" file, which will prevent the key from being published to GitHub. 

Gems required for use can be installed using the ```bundle install``` command in the command line.

RUNNING THE APP Open Run the rails s command in the backend (https://github.com/kwokasch/Brew-Book-Backend) Run the lite-server command in the frontend (https://github.com/kwokasch/Brew-Book-Frontend)

HOW TO USE THE APP This video demonstrates how to search for, create, favorite, and un-favorite beers on the Brew Book app: https://youtu.be/jUiugoPe5HQ.

CONTRIBUTING Katie Wokasch
Flatiron School, 2019