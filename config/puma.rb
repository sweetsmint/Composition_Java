# Specify the bind host and environment.
bind "tcp://0.0.0.0:#{ENV.fetch("PORT") { "8000" }}"
environment ENV.fetch("RAILS_ENV") { "production" }

# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setti