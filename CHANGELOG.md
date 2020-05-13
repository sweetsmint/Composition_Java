
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a
Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

### Added

- Ability to customize `UID` and `GID` if you're not using `1000:1000` (check the `.env.example` file)
- Output `docker compose logs` in CI for easier debugging

### Changed

- Replace `Redis.current` (removed in `redis` 5.0+) with `RedisConn.current` which is in `config/initializers/redis.rb`
- Rename `run bash` to `run shell`
- Reference `PORT` variable in the `docker-compose.yml` web service instead of hard coding `8000`
- Adjust Hadolint to exit > 0 if any style warnings are present

#### Languages and services

- Update `Ruby` to `3.2.1`
- Update `Node` to `18.X`
- Update `Postgres` to `15.2`
- Update `Redis` to `7.0.8`

#### Back-end dependencies

- Update `cssbundling-rails` to `1.1.2`
- Update `jsbundling-rails` to `1.1.1`
- Update `minitest` to `5.18.0`
- Update `pg` to `1.4.6`
- Update `puma` to `6.1.1`
- Update `rails` to `7.0.4.2`
- Update `redis` to `5.0.6`
- Update `sidekiq` to `7.0.6`
- Update `stimulus-rails` to `1.2.1`
- Update `turbo-rails` to `1.4.0`

#### Front-end dependencies

- Update `@hotwired/stimulus` to `3.2.1`
- Update `@hotwired/turbo-rails` to `7.3.0`