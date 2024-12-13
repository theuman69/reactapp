# Use the official Node.js image
FROM node:14

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the React app
RUN npm run build

# Use a lightweight HTTP server to serve the React app
RUN npm install -g serve

# Correctly expose port 3000
EXPOSE 3000

CMD ["serve", "-s", "build", "-l", "3000"]

