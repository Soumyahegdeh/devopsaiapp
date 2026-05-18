FROM node:20-alpine AS builder
WORKDIR /app

# Upgrade npm to get patched bundled tar
RUN npm install -g npm@latest

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build


FROM node:20-alpine
ENV NODE_ENV=production
WORKDIR /app

# Upgrade npm to get patched bundled tar
RUN npm install -g npm@latest

COPY package*.json ./
RUN npm ci --omit=dev

COPY --from=builder /app/dist ./dist

RUN addgroup -g 1001 -S nodejs && adduser -S nodejs -u 1001
USER nodejs

EXPOSE 3005
CMD ["node", "dist/index.js"]