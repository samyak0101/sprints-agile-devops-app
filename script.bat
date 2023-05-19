@echo off

rem ========================
echo Running database-backend
cd /d %~dp0\database-backend && docker-compose up -d --restart always

rem ========================
echo Building Flask
cd /d %~dp0\flask-back-end && docker build -t flask .

rem ========================
echo Running backend
cd /d %~dp0\flask-back-end && docker run -p 5238:5238 -d --restart always --name backend flask

rem ========================
echo Connecting backend-db
docker network create flask-sql && docker network connect flask-sql db2 && docker network connect flask-sql backend

rem ========================
echo Running ngrok
set "NGROK_FLASK_URL="
for /f "tokens=*" %%a in ('docker run -d --restart always --link backend -e NGROK_AUTHTOKEN=2OyTFkUHCiq9DGTiIt0cnspNcF5_5peMcvDHq4TUFwpfjJTBA ngrok/ngrok:alpine http backend:5238') do set NGROK_FLASK_URL=%%a
echo %NGROK_FLASK_URL%

rem ========================
echo Building Express
cd /d %~dp0\express-back-end && docker build -t express .

rem ========================
echo Running Express
cd /d %~dp0\express-back-end && docker run -d -p 3001:3001 --restart always --name ex express

rem ========================
echo Running ngrok for Express
set "NGROK_EXP_URL="
for /f "tokens=*" %%a in ('docker run -d --link express --restart always -e NGROK_AUTHTOKEN=2OyT6kTwcX5rganv6J7MwMlTC7R_3F8id2Y1KoXMDGJzb7gh1 ngrok/ngrok:alpine http express:3001') do set NGROK_EXP_URL=%%a
echo %NGROK_EXP_URL%

rem ========================
echo Building Frontend
cd /d %~dp0\react-front-end && docker build -t frontend .

rem ========================
echo Running Frontend
docker run -d -p 3000:3000 -e SERVER_URL=%NGROK_FLASK_URL% -e EXPRESS_URL=%NGROK_EXP_URL% --name rf frontend

rem ========================
echo All tasks completed
pause
