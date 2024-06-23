# Use official Ruby base image with version 3.1.2
FROM ruby:3.1.2

# Set Rails environment to production
ENV RAILS_ENV=production

# Set working directory inside the container
WORKDIR /app

# Copy Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install dependencies specified in the Gemfile
RUN gem install bundler:2.3.6 && bundle install --jobs 20 --retry 5

# Copy the rest of the application code into the container
COPY . .

# Expose port 3000 to allow communication to/from the Rails application
EXPOSE 3000

# Command to start the Rails server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
