# Putting it All Together: Rails CRUD

## Learning Goals

- Generate an API that follows REST conventions
- Handle full CRUD with one model

## Introduction

Now's your chance to put all the CRUD actions we've been learning to good use!
We're going to be building out an API in Rails as a backend for a spice store.
There's a React application in the `/client` directory that's all set up for the
frontend; your goal is to build out the necessary CRUD actions in the backend by
following RESTful conventions.

## Setup

To set up the frontend and backend dependencies, from the root directory, run:

```sh
npm install --prefix client
bundle install
```

You should get the tests passing first by running `learn test`.

## Instructions

### Spice Model

Generate a class and migrations for a `Spice` model with the following attributes:

- `title` (string)
- `image` (string)
- `description` (string)
- `notes` (string)
- `rating` (float)

After you've created the model, check your work by running:

```sh
rails db:migrate db:seed
```

Then, use `rails c` to view data about the spices.

### Routes

Your API should have the following routes:

- `GET /spices`: return an array of all spices
- `POST /spices`: create a new spice
- `PATCH /spices/:id`: update an existing spice
- `DELETE /spices/:id`: delete an existing spice

Make sure to follow REST conventions for generating these routes.

You should also use strong params in the controller for the POST and PATCH
requests.

Use the tests to guide your progress and ensure that each route has the expected
JSON response body and HTTP status code. You can also run the server with
`rails s` and test out the routes manually using Postman.

Good luck! 💪

Once your API is working, you can try out the full application in the browser
when you're ready to see everything come together. Run both the Rails
application and the React application together with:

```sh
rails start
```

- React: [http://localhost:4000](http://localhost:4000)
- Rails: [http://localhost:3000](http://localhost:3000)
