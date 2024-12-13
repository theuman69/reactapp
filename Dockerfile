# Use the official Node.js image
FROM node:14

# Set the working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the application files
COPY . .

# Build the React application
RUN npm run build

# Serve the application using a lightweight web server
RUN npm install -g serve
CMD ["serve", "-s", "build"]

# Expose the port where the app will run
EXPOSE 5000

