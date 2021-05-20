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

**First**, you should get the tests passing first by running `learn test`.

Then you can try out the full application in the browser when you're ready to
see everything come together. Run both the Rails application and the React
application together by running:

```sh
rails start
```

- React: [http://localhost:4000](http://localhost:4000)
- Rails: [http://localhost:3000](http://localhost:3000)

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

Your API should have the following routes, which each returns the appropriate
JSON data:

#### Index Route

```txt
GET /spices


Response Body
-------
[
  {
    "id": 1,
    "title": "Allspice Berries, Whole (Jamaican)",
    "image": "https://www.spicejungle.com/...",
    "description": "Allspice has a curious name...",
    "notes": "Pungent, Sweet, Warm & Earthy",
    "rating": 3.5
  },
  {
    "id": 2,
    "title": "Caraway Seeds",
    "image": "https://www.spicejungle.com/...",
    "description": "A crusty grandmother. She walked ...",
    "notes": "Bitter or Astringent, Sweet",
    "rating": 2
  }
]
```

#### Create Route

In your controller's `create` action, use strong params when creating the new
`Spice` object.

```txt
POST /spices


Headers
-------
Content-Type: application/json


Request Body
------
{
  "title": "Allspice Berries, Whole (Jamaican)",
  "image": "https://www.spicejungle.com/...",
  "description": "Allspice has a curious name...",
  "notes": "Pungent, Sweet, Warm & Earthy",
  "rating": 3.5
}


Response Body
-------
{
  "id": 1,
  "title": "Allspice Berries, Whole (Jamaican)",
  "image": "https://www.spicejungle.com/...",
  "description": "Allspice has a curious name...",
  "notes": "Pungent, Sweet, Warm & Earthy",
  "rating": 3.5
}
```

#### Update Route

Making a PATCH request to this route with an object in the body should update
one spice, and return the updated spice in the response. You should use strong
params to handle the update.

```txt
PATCH /spices/:id


Headers
-------
Content-Type: application/json


Request Body
------
{
  "rating": 1
}


Response Body
-------
{
  "id": 1,
  "title": "Allspice Berries, Whole (Jamaican)",
  "image": "https://www.spicejungle.com/...",
  "description": "Allspice has a curious name...",
  "notes": "Pungent, Sweet, Warm & Earthy",
  "rating": 1
}
```

#### Destroy Route

Making a DELETE request to this route should delete one spice from the database.
You should return a response of `head :no_content` to indicate a successful
deletion.

```txt
DELETE /spices/:id


Response Body
------
no content
```
