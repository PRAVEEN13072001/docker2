# Use an official Node.js runtime as a parent image
FROM node:16

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the React app for production with minification
RUN npm run build

# Install `serve` to serve the production build
RUN npm install -g serve

# Set the environment variable for the port
ENV PORT 3000

# Expose port 3000 to the outside world
EXPOSE 3000

# Start the application using `serve`
CMD ["serve", "-s", "build", "-l", "3000"]
