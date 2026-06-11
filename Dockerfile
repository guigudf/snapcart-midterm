# Use the official Node.js 18 Alpine base image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package files first (for layer caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose the port SnapCart runs on
EXPOSE 3000

# Start the application
CMD ["npm", "start"]