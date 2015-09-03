use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :elixir_resources, ElixirResources.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  cache_static_lookup: false,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin"]]

# Watch static and templates for browser reloading.
config :elixir_resources, ElixirResources.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development.
# Do not configure such in production as keeping
# and calculating stacktraces is usually expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :elixir_resources, ElixirResources.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "elixir_resources",
  password: "postgres",
  database: "elixir_resources_dev",
  pool_size: 10

config :exq,
  host: "127.0.0.1",
  port: 6379,
  namespace: "jobqueue",
  queues: ["default"],
  poll_timeout: 50,
  scheduler_enable: false,
  scheduler_poll_timeout: 200

