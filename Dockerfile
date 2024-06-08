FROM node:18-alpine AS base

# Install dependencies only when needed
FROM base AS builder
# Check https://github.com/nodejs/docker-node/tree/b4117f9333da4138b03a546ec926ef50a31506c3#nodealpine to understand why libc6-compat might be needed.
RUN apk add --no-cache libc6-compat
WORKDIR /app

# Copy project files
COPY . .

# Enable pnpm
RUN corepack enable pnpm

# Install dependencies
RUN pnpm i --frozen-lockfile

# Build
RUN pnpm run build

# Production image, copy all the files and run next
FROM node:18
WORKDIR /app

ENV NODE_ENV production

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 gonet

COPY --from=builder --chown=gonet:nodejs /app/package.json .
COPY --from=builder --chown=gonet:nodejs /app/build build/

USER gonet

EXPOSE 3000

ENV PORT 3000

CMD HOSTNAME="0.0.0.0" node build
