# Use a smaller base image
FROM node:lts-alpine AS development

# Declaring env
ENV NODE_ENV development

# Setting up the work directory
WORKDIR /react-app

# Copying package files separately to leverage caching
COPY package.json package-lock.json /react-app/

# Installing dependencies
RUN npm ci

# Copying the rest of the project files
COPY . .

# Starting our application
CMD npm start
