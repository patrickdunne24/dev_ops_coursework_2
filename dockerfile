# Step 1: Use a Node.js base image
FROM node:16-alpine

# Step 2: Set the working directory inside the container
WORKDIR /usr/src/app

# Step 3: Copy application files into the container
COPY server.js ./

# Step 4: Expose the application port
EXPOSE 8081 443

# Step 5: Define the command to run the application
CMD ["node", "server.js"]
