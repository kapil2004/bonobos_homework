# Bonobos Assignment

### Getting Started

This app uses Postgres database. After cloning this repo, run the following commands to setup the database and the application.

```
> bundle install
> rake db:setup
> rake db:migrate
```

### Goal #1

Run the following rake task to load products and their inventory to the database.
```
> rake bonobos:load_products
```

### Goal #2

This app uses RSpec for testing. Run the following command to run tests.
```
> rspec spec
```

#### Logic for finding products
1. If the search term is empty, return a null product in JSON response.
2. If a search term is provided, first try to find a product with a exact match and return the product if found.
3. If there is no exact match, I use words from the search term to do a SQL 'LIKE' match with product name.
4. If there is still no product found, I use fuzzy match logic. Here I see which product's name includes the most number of characters from the search term and return the product with the maximum character matches found.

### Goal #3

Start Rails server first. It runs at http://localhost:3000.
```
> rails s
```

I used a simple React based frontend for the webpage. Start the React app as follows:
```
> cd bonobos_hw_frontend
> npm install
> npm run start
```

Goto http://localhost:8080. You should see a simple form with a search input. After you enter a search term and submit the form, you should see one product returned as a result below the form.
