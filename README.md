# Yugioh
Online Yu-Gi-Oh! store featuring cards from the famous card game

## Purpose
Get infromed about cards in the game
Buy cards

## Live Version
Available on heroku at:
> ```https://glacial-taiga-95259.herokuapp.com```

## Running the Application Locally

1. > ```cd``` in to the Assessment3 folder
2. > run ```bundle install``` on terminal
3. > migrate the database by running ```rails db:migrate```
4. > seed the databases using:
4.1 >```rake user:seed_users``` WARNING: Please save the Admin credentials ass you will need them later
4.2 >```rake user:seed_credit_cards``` 
4.3 >```rake user:seed_addresses``` 
4.4 >```rake cards:seed_cards``` 
4.5 >```rake cards:seed_sets``` 
4.6 >```rake cards:seed_stock``` 
4.7 >```rake order:seed_orders``` 
4.8 >```rake payment:seed_payments``` 
5. > start the application with ```rails s```
6. > to access the application, open your web browser, type ```http://localhost:3000``` in to the address bar


## Features Included:
1. Linked Tables (Stock, Order, Payment etc)
2. User defined graphs using the open data. (accessed through /cards , /yugioh_sets)
3. Live API Data. (The actual market price of each card returned in JSON form and picture)
4. Advanced Search bar capable of showing similar results as the user input and filets 
(search bar is in the header, filters can be found at /stocks)
5. User cart and multi-purchase check-out
6. Different levels of access (Guest, Standard user, Admin)
7. Admin statistics displayed using Charts
8. Capybara and Cucumber tests
9. Bootstrap is fully integrated.
10. Application is deployed on Heroku
Admin Email: admin@admin.com
Admin Password: 8786843869 (random generated when seeding)

## Testing

To run Capybara test use bundle exec rspec
To run Cucumber tests use bundle exec rspec

#### Issue #1

Admin can't create more admins (Sorry i realised at the last second )

#### Issue #2

No custom 404 page

#### Issue #3

Sometimes the API doesn't return a price due to its database being updated by the API admins

#### Issue #4

In order to reduce API calls, the price only updates when clicking on show and cart


## Data sources
Open Data:
- Data was manually created into a csv with information from:
https://www.kaggle.com/tathor/yugioh-trading-cards-dataset 
https://en.wikipedia.org/wiki/Yu-Gi-Oh!_Trading_Card_Game 

Live API Data:
https://yugiohprices.docs.apiary.io/#
