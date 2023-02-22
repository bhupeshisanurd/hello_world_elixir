# Use the official Elixir image as the base image
FROM elixir:1.12.3-alpine

# Install the dependencies
RUN apk add --update nodejs npm

# Set the environment variable for the app name
ENV APP_NAME hello_world_elixir

# Create the application directory
RUN mkdir /$APP_NAME
WORKDIR /$APP_NAME

# Install hex and rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Copy the application files and compile the application
COPY mix.exs mix.lock ./
COPY config config
RUN mix deps.get
RUN mix deps.compile

# Copy the remaining application files and compile the application
COPY lib lib
RUN mix compile

# Expose the Phoenix port
EXPOSE 4000

# Start the Phoenix server
CMD mix phx.server
