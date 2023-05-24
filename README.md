# Sprint (DevOps Tool for students)



![image](https://user-images.githubusercontent.com/52031393/236638821-66dd9b68-0711-49c6-aa0d-6e3709ec618d.png)


# v2.0
Last updated: 5/18/2023 by Samyak
AGDev43 (L2_43)
authors: samyak, mark, manisha, allen, irving, casilda

# Quick start
This repository contains 4 folders. You only need 2 commands to run the entire application:
1. Git clone
2. docker-compose up -d


## Pre-reqs:
1. Installed Docker
2. Ran docker desktop (docker daemon needs to be running)
3. Have at least 1gb of free ram and memory
4. No services running on ports 3000, 3306, 8080, 5238, 3001 (these ports are used by sprints)

### Let's get started

After the pre-reqs, clone the repository and type:
`docker-compose up -d`
This will take some time, so watch some tiktok and come back in 2 minutes!
`docker ps`
This should show you 5 containers running. Now, go to your browser window and:
`http://localhost:3000`
Sprints should now be running!

View Demo.md for more details!

# Description
These are the current features of the product:
1. login and logout with google (no signup feature yet).
2. login-protect all app-pages
3. taskboard (add new tasks, edit, delete tasks) - [all working]
4. story poker (create, answer, view stories) - [all working]
5. chatroom [working]


### Create, Edit, Delete tasks:
![image](https://user-images.githubusercontent.com/52031393/236638875-3fdcf65c-201e-4aab-a93a-843fbf9fd580.png)

### Start a story poker session!
![image](https://user-images.githubusercontent.com/52031393/236638922-6662b3e9-2b63-4355-b0c3-192e2105bda9.png)

### Instantly text people using the app
![image](https://user-images.githubusercontent.com/52031393/236638936-6b79d390-8825-4129-987b-42df9869b1c4.png)

### Learn about agile!
![image](https://user-images.githubusercontent.com/52031393/236638954-83ac144f-eaea-45fd-84b7-a9ec11f88c57.png)

View the Requirements doc for project specifications. This is the final doc (there were 3 versions). 
Update: Got an email from the professor declaring this the best project of CS 506 (Software Engineering) this semester (Spring 2023) and potentially overrall. 

I'm excited to be able to share this with people! I don't see an everyday use for this but after completing docker instructions anyone can clone and run the entire app with detailed instructions. Email me at sjain85@wisc.edu to work with me on my next project much bigger and better than this!
