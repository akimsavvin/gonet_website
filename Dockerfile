FROM node:18-alpine AS builder
WORKDIR /app

# Install pnpm
RUN npm install -g pnpm

# Copy package.json and pnpm-lock.yaml (if present)
COPY package.json pnpm-lock.yaml ./

# Install dependencies using pnpm
RUN pnpm install

# Copy the rest of the application code
COPY . .

# Build the application
RUN pnpm run build

# Prune development dependencies
RUN pnpm prune --prod

FROM node:18-alpine
WORKDIR /app

# Copy build and production node_modules from the builder stage
COPY --from=builder /app/build build/
COPY --from=builder /app/node_modules node_modules/
COPY package.json .

# Set environment variables
EXPOSE 3000
ENV NODE_ENV=production

# Start the application
CMD [ "node", "build" ]
