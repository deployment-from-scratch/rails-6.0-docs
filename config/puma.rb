# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers: a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum; this matches the default thread size of Active Record.
#
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

environment = ENV.fetch("RAILS_ENV") { "development" }

app_path = ENV.fetch("APP_PATH") { Dir.pwd }

if environment == 'production'
  bind       "unix://#{app_path}/tmp/puma.sock"
  pidfile    "#{app_path}/tmp/puma.pid"
  state_path "#{app_path}/tmp/puma.state"
else
  port        ENV.fetch("PORT") { 3000 }
end

# Specifies the `environment` that Puma will run in.
#
environment environment

# Specifies the number of `workers` to boot in clustered mode.
# Workers are forked webserver processes. If using threads and workers together
# the concurrency of the application would be max `threads` * `workers`.
# Workers do not work on JRuby or Windows (both of which do not support
# processes).
#
workers ENV.fetch("WEB_CONCURRENCY") { 2 }

fork_worker
