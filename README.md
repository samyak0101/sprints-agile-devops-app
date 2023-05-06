# Sprint (DevOps Tool for students)

Try it out!
https://2ced-128-105-37-247.ngrok-free.app/
This url will probably be inactive after 10th May 2023. Potentially active up until September 5th 2023. 

![image](https://user-images.githubusercontent.com/52031393/236638821-66dd9b68-0711-49c6-aa0d-6e3709ec618d.png)


# v2.0
Last updated: 4/19/2023
AGDev43 (L2_43)
authors: samyak, mark, manisha, allen, irving, casilda

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
1. login and logout with google (no signup feature yet).
2. login-protect all app-pages
3. taskboard (add new tasks, edit, delete tasks) - [all working]
4. story poker (create, answer, view stories) - [all working]
5. chatroom [working]


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

### Create, Edit, Delete tasks:
![image](https://user-images.githubusercontent.com/52031393/236638875-3fdcf65c-201e-4aab-a93a-843fbf9fd580.png)

### Start a story poker session!
![image](https://user-images.githubusercontent.com/52031393/236638922-6662b3e9-2b63-4355-b0c3-192e2105bda9.png)

### Instantly text people using the app
![image](https://user-images.githubusercontent.com/52031393/236638936-6b79d390-8825-4129-987b-42df9869b1c4.png)

### Learn about agile!
![image](https://user-images.githubusercontent.com/52031393/236638954-83ac144f-eaea-45fd-84b7-a9ec11f88c57.png)
