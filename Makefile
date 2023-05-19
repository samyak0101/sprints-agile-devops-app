.PHONY: all

all: database-backend build-flask run-backend connect-backend-db run-ngrok build-express run-express run-ngrok-express build-frontend run-frontend

database-backend:
	cd ./database-backend && docker-compose up -d --restart always

build-flask:
	cd ./flask-back-end && docker build -t flask .

run-backend:
	cd ./flask-back-end && docker run -p 5238:5238 -d --restart always --name backend flask

connect-backend-db:
	docker network create flask-sql && docker network connect flask-sql db2 && docker network connect flask-sql backend

run-ngrok:
	export SERVER_URL=$$(docker run -d --restart always --link backend -e NGROK_AUTHTOKEN=2OyTFkUHCiq9DGTiIt0cnspNcF5_5peMcvDHq4TUFwpfjJTBA ngrok/ngrok:alpine http backend:5238 | awk '/^Forwarding/ {print $$NF}') && echo $$NGROK_FLASK_URL

build-express:
	cd ../express-back-end && docker build -t express .

run-express:
	cd ../express-back-end && docker run -d -p 3001:3001 --restart always --name ex express

run-ngrok-express:
	export EXPRESS_URL=$$(docker run -d --link express --restart always -e NGROK_AUTHTOKEN=2OyT6kTwcX5rganv6J7MwMlTC7R_3F8id2Y1KoXMDGJzb7gh1 ngrok/ngrok:alpine http express:3001 | awk '/^Forwarding/ {print $$NF}') && echo $$NGROK_EXP_URL

build-frontend:
	cd ../react-front-end && docker build -t frontend .

run-frontend:
	docker run -d -p 3000:3000 -e SERVER_URL=$$(docker inspect -f '{{.Config.Env}}' backend | grep SERVER_URL | cut -d= -f2) -e EXPRESS_URL=$$(docker inspect -f '{{.Config.Env}}' ex | grep EXPRESS_URL | cut -d= -f2) --name rf frontend
