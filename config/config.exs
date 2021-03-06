# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :people,
  ecto_repos: [People.Repo]

# Configures the endpoint
config :people, PeopleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FeQmMMDybuv3uPbZ3jc/H5gbl4oBeAkSTxxjUU85hCKuEXrM47Kda9Gbrs4a61Gf",
  render_errors: [view: PeopleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: People.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
