# Demo + DIY details

https://uwmadison.zoom.us/rec/share/iFaoperAaj-tyHLcIWajps5Axdp2aRrRPe-7jTEe312F-QA5bl5sb3ucfX950hcw.w6tvkaVvVwKuSNKX

Passcode: i^3LgzfG

# Docker structure:

phpmyadmin and mysql containers run together from Casilda's mysql docker-compose file. Once they are running, localhost 8080 should have the php image. localhost 3306 should have the mysql databse and the image should be called 'database'. 

Once database is set-up, we run the flask server on 5238. Flask container will be called 'backend'. Once this container is running, we need to connect it to the database for queries. 

We create a docker network with backend and database. Now, since the flask server calls the main function of dbservices, the main function accepts arguments hostname, password, query, database, and user. 

Current default fields: hostname="agdev-db", portnum=3306, query="select * from Task;", user="root", password="mc", database="AGDev43".

From this, mysql will find the hostname through the docker container and post the query and get responses. Now, we have a working backend + database. 

To use them, we can either publish the flask container's url or access it through localhost (i was not successful in doing this but didn't try hard enough). Essentially, we would now run the react container on localhost 3000. However, the react host has to communicate with flask. For this, it is possible to use localhost 5238 since the docker container is running there. 

So, in the config file in the front-end, replace the SERVER_URL to be http://localhost:5238
This should hopefully connect to the flask backend. You can test using postman.

One more thing. Chatroom. For the chatroom, it is necessary to run and connect the express server. I tested this locallly so I know it's pretty easy. Run the express docker container on 3001 and make sure the chatroom.js url is localhost:3001. 

And that's it. You should now have a full on working application using about 5 docker containers. Php docker container is optional. So, react + flask + sql + express = 4 containers.

An ngrok container can be added on to publish the localhost url for people to interact. Even better, create docker-compose.yml and transfer all files to aws. Then anyone can access the app. Anyone know where I can get free domain names maybe?


# Quick Start

First, start all containers using
`docker-compose up -d`
Note: Ensure your ports 3000, 3001, 5238, 8080, 3306 are free. These ports will be used by docker containers.

On success, you should have the above 5 ports running services on your local machine. Enter
`http://localhost:3000`
to verify. You should be able to go to the chatroom and enter messages now. You will notice that the taskboard doesn't work just yet **it needs a little more work**.

For the **taskboard and story poker**, open up `http://localhost:8080` on your browser (this should be the phpmyadmin console). You should see an interface that looks like a website a 12 year-old created to impress their parents. 

Once it's running, click on the `import` option on the navbar and then select the `AGdev43` text on the left-side panel. This will be the target for the import. On the import console, select the AGDev43.sql file from the database-backend folder of this project and click load. 

Once loaded, you should be able to interact with the app normally. Enjoy!

### Additional docker commands

To stop all containers: docker-compose down --rmi all (this will also remove all images, remove the --rmi flag to only remove containers for faster restarts).
To execute commands in a container: docker exec -it <container_id> /bin/bash
To attach in a container: 
Networking debugging:
docker exec -it rf ping express (from host machine, to check container working)



### Previous docker commands I used

docker build -t express .
docker run -it -p 3001:3001 --name ex express

docker build -t frontend .
docker run -it -p 3000:3000 --name rf frontend

docker build -t flask .
docker run -p 5238:5238 -d --name backend flask

docker run -it --link backend -e NGROK_AUTHTOKEN=token ngrok/ngrok:alpine http backend:5238

docker-compose up -d .
(for sql database^)
