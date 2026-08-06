FROM node:20-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN npm install --production

# Bundle app source
COPY . .

# Generate Prisma Client
RUN npx prisma generate

EXPOSE 3000
CMD [ "npm", "start" ]
