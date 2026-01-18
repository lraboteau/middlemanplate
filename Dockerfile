# Build stage
FROM ruby:3.4-alpine AS builder

# Install dependencies
RUN apk add --no-cache \
    build-base \
    nodejs \
    npm \
    git

WORKDIR /app

# Install Ruby dependencies
COPY Gemfile Gemfile.lock* ./
RUN bundle config set --local deployment 'true' && \
    bundle config set --local without 'development test' && \
    bundle install

# Install Node dependencies
COPY package.json package-lock.json* ./
RUN npm ci --production=false

# Copy source files
COPY . .

# Build CSS with Tailwind
RUN npm run build:css

# Build static site
RUN bundle exec middleman build --verbose

# Production stage
FROM nginx:alpine

# Copy nginx configuration
COPY config/nginx/nginx.conf /etc/nginx/nginx.conf

# Copy built files
COPY --from=builder /app/build /usr/share/nginx/html

# Expose port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
