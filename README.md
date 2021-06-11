# Flight Engine

Flight engine is an api that consumes the Amadues flight offers api. It allows the user to search for flights based on origin, destination, departure date, passengers, and more. In order to use this API you have to create a profile on Postman in order to recieve an api key. From there you can use the endpoints shown below on heroku. https://flight-engine-1.herokuapp.com

## Author

- ** Joseph Budina


## Getting Started

### Versions
  - Rails 5.2.5

  - Ruby 2.5.3

### Setup

    1. Clone Repo
    2. Install gem packages: `bundle install`
    3. Setup, Migrate and Seed the database: `rails db:(create,migrate,seed)`

## Built With

  - Ruby/Rails
  - PostgreSQL
  - Heroku
  - RSpec

## Endpoints

https://flight-engine-1.herokuapp.com

### Create a profile
  - `POST /api/v1/users`
    - Requires an email, password, and password confirmation. Best to do so with postman.
<img width="714" alt="Screen Shot 2021-06-10 at 12 42 51 PM" src="https://user-images.githubusercontent.com/52386927/121579901-64c30f00-c9e9-11eb-8a15-9901fa905159.png">


#### Login
  - `POST /api/v1/sessions`
    - Allows you to login
 <img width="645" alt="Screen Shot 2021-06-10 at 12 46 03 PM" src="https://user-images.githubusercontent.com/52386927/121580307-d3a06800-c9e9-11eb-963d-189b9491915f.png">
 
#### Searches table

The searches table is used to collect data from the user in order to implement flight recommendations for a feature to be added in the future.

### Find flight info
  - `GET /api/v1/searches`
    - required query params: 
      - Origin & Destination both require a three letter location code. These codes can be found here https://www.iata.org/en/publications/directories/code-search/
      - Passengers takes the amount of people you plan on boarding the plane with
      - deparature takes the inteded departure date as such: 2021-06-17
      - An api key must be provided
   - Ex: `GET /api/v1/searches?origin=LAX&destination=NYC&passengers=1&departure=2021-06-17&api_key=859ff6b2-add6-4a73-8f2a-893a8c8d5601`
#### Optional params to filter or sort with
  - Return date: 
    - `GET /api/v1/items/searches?origin=LAX&destination=NYC&passengers=1&departure=2021-06-17&returndate=2021-15-17&api_key=859ff6b2-add6-4a73-8f2a-893a8c8d5601`
    - Allows you to retrieve flights by return date
  - Max price:
    - `GET /api/v1/items/searches?origin=LAX&destination=NYC&passengers=1&departure=2021-06-17&maxprice=200&api_key=859ff6b2-add6-4a73-8f2a-893a8c8d5601`
    - Allows you to retrieve flights by the maximum price you are willing to spend
  - Limit:
    -  `GET /api/v1/items/searches?origin=LAX&destination=NYC&passengers=1&departure=2021-06-17&limit=10&api_key=859ff6b2-add6-4a73-8f2a-893a8c8d5601`
    - Allows you to retrieve a specific amount of flights
  - Sort:
    - sort choices are by least amount of `layovers` & `price` 
    -  `GET /api/v1/items/searches?origin=LAX&destination=NYC&passengers=1&departure=2021-06-17&sort=layovers&api_key=859ff6b2-add6-4a73-8f2a-893a8c8d5601`
    -  `GET /api/v1/items/searches?origin=LAX&destination=NYC&passengers=1&departure=2021-06-17&sort=price&api_key=859ff6b2-add6-4a73-8f2a-893a8c8d5601`
    - Allows you to retrieve flights sorted by either lowest cost or least amount of stops

## License

  This belongs to Joseph Budina.
