# Flight Engine

Rails Engine is an open-source API that allows you to search through merchants, items, and their related invoices. It allows you to retrieve information like revenue and how many items have been sold.

## Table of Contents

  - [Authors](#authors)
  - [Getting Started](#getting-started)
    - [Versions](#versions)
    - [Setup](#setup)
  - [Built With](#built-with)
  - [Endpoints](#endpoints)
    - [Merchants](#merchants)
      - [Search Merchants](#search-merchants)
    - [Items](#items)
      - [Search Items](#search-items)
    - [Business Intelligence](#business-intelligence)
  - [License](#license)
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

## Endpoints

### Create a profile
  - `POST https://flight-engine-1.herokuapp.com/api/v1/users`
    - Requires an email, password, and password confirmation. Best to do so with post man.
<img width="714" alt="Screen Shot 2021-06-10 at 12 42 51 PM" src="https://user-images.githubusercontent.com/52386927/121579901-64c30f00-c9e9-11eb-8a15-9901fa905159.png">


#### Search Merchants
  - `GET /api/v1/merchants/find?name={name}`
    - Allows you to retrieve one merchant by name fragment
  - `GET /api/v1/merchants/find_all?name={name}`
    - Allows you to retrieve merchants by name fragment in alphabetical order

### Items
  - `GET /api/v1/items`
    - Allows you to retrieve all merchants
    - `GET /api/v1/items?per_page={number}&page={number}`
      - Allows you to retrieve one page of items based on page number and based on how many items per page.
  - `GET /api/v1/items/{item_id}`
      - Allows you to retrieve an item based on item_id
  - `POST /api/v1/items`
    - Allows you to create a new item
  - `DELETE /api/v1/items/{item_id}`
      - Allows you to delete an item based on item_id
  - `PUT /api/v1/items/{item_id}`
    - Allows you to update an item based on item_id
  - `GET /api/v1/items/{item_id}/merchant`
    - Allows you to retrieve an item's merchant based on item_id
#### Search Items
  - `GET /api/v1/items/find?name={name}`
    - Allows you to retrieve one item by name fragment
  - `GET /api/v1/items/find?min_price={number}`
    - Allows you to retrieve one item with a price equal to or greater than min_price
  - `GET /api/v1/items/find?max_price={number}`
    - Allows you to retrieve one item with a price equal to or less than max_price
  - `GET /api/v1/items/find?min_price={number}&max_price={number}`
    - Allows you to retrieve one item with a price equal to or greater than min_price and equal to or less than max_price
  - `GET /api/v1/items/find_all?name={name}`
    - Allows you to retrieve items by name fragment in alphabetical order
  - `GET /api/v1/items/find_all?min_price={number}`
    - Allows you to retrieve all items with a price equal to or greater than min_price
  - `GET /api/v1/items/find_all?max_price={number}`
    - Allows you to retrieve all items with a price equal to or less than max_price
  - `GET /api/v1/items/find_all?min_price={number}&max_price={number}`
    - Allows you to retrieve all items with a price equal to or greater than min_price and equal to or less than max_price

### Business Intelligence
  - `GET api/v1/revenue/merchants?quantity={number}`
    - Allows you to get the top x number of merchants with the most revenue based on quantity
  - `GET /api/v1/merchants/most_items?quantity={number}`
    - Allows you to get the top x number of merchants with the most items based on quantity
  - `GET /api/v1/revenue/items?quantity={number}`
    - Allows you to get the top x number of items with the most revenue based on quantity
  - `GET /api/v1/revenue/unshipped?quantity={number}`
    - Allows you to get the top x number of invoices with the most potential revenue in unshipped items based on quantity

## License

  This belongs to Joseph Budina.

http://localhost:3000/api/v1/searches?origin=LAX&destination=NYC&passengers=1&departureDate=2021-06-17
