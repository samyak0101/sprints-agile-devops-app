# Sprint (DevOps Tool for students)

# v2.0
Last updated: 4/19/2023
AGDev43 (L2_43)
authors: samyak, mark, manisha, allen, irving

# Quick start
This repository contains two folders. To run the front-end, clone the repository and cd into the front-end folder.
Then:
`npm ci`
`npm start`

To access the chatroom feature, open a new terminal in the same directory and type
`npm run server`

The backend is not run. Rather, it is a storage to show the current back-end code running on the docker services. 

# Description
These are the current features of the product:
1. login and logout with google (no signup yet, mark working on it)
2. login-protect all app-pages
3. taskboard (add new tasks, retreive tasks not working yet but manisha working on it)
4. story poker (ui ready, backend in progress samyak and casilda)
5. post any query to db
6. chatroom (over same network only).


# Docker 

This repository requires an active connection to the csl database where there are 4 containers already running. We are yet to export these containers to outside the csl machine. These are: flask, ngrok (optional), phpmyadmin, sql server

Clone this repository once the above is set up. Or, just clone it for chatroom and front-end functionality.

After cloning, cd into the react front end folder and type
`docker build -t frontend .`.\
`docker run -it -p 3000:3000 --name rf frontend`

This will run the front-end container. To make sure chatroom works, see that the url in chatroom.js is http://host.docker.internal:3001

cd into the express back end folder and type in
`docker build -t express .`
`docker run -it -p 3001:3001 --name ex express`

This will run everything. Now, just go to localhost:3000 in your web browser and you should be able to access the application.

# Problems
