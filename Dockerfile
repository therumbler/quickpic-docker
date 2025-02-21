FROM node:18-alpine

# Set working directory
WORKDIR /app

# Install Git
RUN apk add --no-cache git
RUN apk add --no-cache curl 

RUN npm install -g pnpm@latest-10

# Clone the Next.js repository (replace with your repo URL)
ARG REPO_URL=https://github.com/t3dotgg/quickpic.git
RUN git clone --depth=1 $REPO_URL .

# Install dependencies
RUN pnpm install

# Build the Next.js project
RUN pnpm run build

# Expose the Next.js default port
EXPOSE 3000

# Start the Next.js application
CMD ["pnpm", "run", "start"]
