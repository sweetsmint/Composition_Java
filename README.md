# An example Rails + Docker app

![CI](https://github.com/nickjj/docker-rails-example/workflows/CI/badge.svg?branch=main)

You could use this example app as a base for your new project or as a guide to
Dockerize your existing Rails app.

The example app is minimal but it wires up a number of things you might use in
a real world Rails app, but at the same time it's not loaded up with a million
personal opinions.

For the Docker bits, everything included is an accumulation of [Docker best
practices](https://nickjanetakis.com/blog/best-practices-around-production-ready-web-apps-with-docker-compose)
based on building and deploying dozens of assorted Dockerized web apps since
late 2014.

**This app is using Rails 7.0.4.2 and Ruby 3.2.1**. The screenshot doesn't get
updated every time I bump the versions:

[![Screenshot](.github/docs/screenshot.jpg)](https://github.com/nickjj/docker-rails-example/blob/main/.github/docs/screenshot.jpg?raw=true)

## Table of contents

- [Tech stack](#tech-stack)
- [Main changes vs a newly generated Rails app](#main-changes-vs-a-newly-generated-rails-app)
- [Running this app](#running-this-app)
- [Files of interest](#files-of-interest)
  - [`.env`](#env)
  - [`run`](#run)
- [Running a script to automate renaming the project](#running-a-script-to-automate-renaming-the-project)
- [Updating dependencies](#updating-dependencies)
- [See a way to improve something?](#see-a-way-to-improve-something)
- [Additional resources](#additional-resources)
  - [Learn more about Docker and Ruby on Rails](#learn-more-about-docker-and-ruby-on-rails)
  - [Deploy to production](#deploy-to-production)
- [About the author](#about-the-author)

## Tech stack

If you don't like some of these choices that's no problem, you can swap them
out for something else on your own.

### Back-end

- [PostgreSQL](https://www.postgresql.org/)
- [Redis](https://redis.io/)
- [Sidekiq](https://github.com/mperham/sidekiq)
- [Action Cable](https://guides.rubyonrails.org/action_cable_overview.html)
- [ERB](https://guides.rubyonrails.org/layouts_and_rendering.html)

### Front-end

- [esbuild](https://esbuild.github.io/)
- [Hotwire Turbo](https://hotwired.dev/)
- [StimulusJS](https://stimulus.hotwired.dev/)
- [TailwindCSS](https://tailwindcss.com/)
- [Heroicons](https://heroicons.com/)

## Main changes vs a newly generated Rails app

Here's a run down on what's different. You can also use this as a guide to
Dockerize an existing Rails app.

- **Core**:
    - Use PostgreSQL (`-d postgresql)` as the primary SQL database
    - Use Redis as the cache back-end
    - Use Sidekiq as a background worker through Active Job
    - Use a standalone Action Cable process
- **App Features**:
    - Add `pages` controller with a home page
    - Add `up` controller with 2 health check related actions
- **Config**:
    - Log to STDOUT so that Docker can consume and deal with log output 
    - Credentials are removed (secrets are loaded in with an `.env` file)
    - Extract a bunch of configuration settings into environment variables
    - Rewrite `config/database.yml` to use environment variables
    - `.yarnc` sets a custom `node_modules/` directory
    - `config/initializers/rack_mini_profiler.rb` to enable profiling Hotwire Turbo Drive
    - `config/initializers/assets.rb` references a custom `node_modules/` directory
    - `config/routes.rb` has Sidekiq's dashboard ready to be used but commented out for safety
    - `Procifile.dev` has been removed since Docker Compose handles this for us
- **Assets**:
    - Use esbuild (`-j esbuild`) and TailwindCSS (`-c tailwind`)
    - Add `postcss-import` support for `tailwindcss` by using the `--postcss` flag
    - Add ActiveStorage JavaScript package
- **Public:**
    - Custom `502.html` and `maintenance.html` pages
    - Generate favicons using modern best practices

Besides the Rails app itself, a number of new Docker related files were added
to the project which would be any file having `*docker*` in its name. Also
GitHub Actions have been set up.

## Running this app

You'll need to have [Docker installed](https://docs.docker.com/get-docker/).
It's available on Windows, macOS and most distros of Linux. If you're new to
Docker and want to learn it in detail check out the [additional resources
links](#learn-more-about-docker-and-ruby-on-rails) near the bottom of this
README.

You'll also need to enable Docker Compose v2 support if you're using Docker