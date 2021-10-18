# Specify the bind host and environment.
bind "tcp://0.0.0.0:#{ENV.fetch("PORT") { "8000" }}"
environment ENV.f