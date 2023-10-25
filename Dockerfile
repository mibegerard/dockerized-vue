# Use the Node.js image as the base
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install project dependencies
RUN npm install
RUN npm install -g @vue/cli

# Copy the rest of the application code to the container
COPY . .

# Build the Vue.js application
RUN npm run build

# Expose the application's port (if your app uses a specific port)
EXPOSE 8080

# Define the command to start the application
CMD [ "npm", "run", "serve" ]