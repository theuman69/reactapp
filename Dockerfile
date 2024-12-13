# Step 1: Use the official Node.js image as the base image
FROM node:14

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the rest of the application's source code to the container
COPY . .

# Step 6: Build the React application for production
RUN npm run build

# Step 7: Install a simple HTTP server to serve the production build
RUN npm install -g serve

# Step 8: Expose the port on which the app will run
EXPOSE 3000

# Step 9: Use serve to serve the React app on port 3000 and ensure it listens on 0.0.0.0
CMD ["serve", "-s", "build", "-l", "0.0.0.0:3000"]

