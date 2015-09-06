# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :elixir_resources, ElixirResources.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "6MoidV1ZY9JmoMfWz4rSheJc3wCAOQ7QpyefhTtfLug6ZfCf2puRoX2r+MudLPve",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: ElixirResources.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :quantum, cron: [
  "* * * * *": {"ElixirResources.Workers.CronJobs", :look_videos},
  "* * * * *": {"ElixirResources.Workers.CronJobs", :look_rss},
]

config :exq,
  host: '127.0.0.1',
  port: 6379,
  #password: "optional_redis_auth",
  namespace: "exq",
  concurrency: :infinite,
  queues: ["aggregator"],
  poll_timeout: 5,
  scheduler_enable: true,
  scheduler_poll_timeout: 5
