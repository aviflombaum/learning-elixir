# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :blog_phoenix,
  ecto_repos: [BlogPhoenix.Repo]

# Configures the endpoint
config :blog_phoenix, BlogPhoenix.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+3IHBgUXhIxloHwZ1D/gOODY5ofUYkJPjynxec7HlcBz9rYSsMGuLhWCCuBlFjrp",
  render_errors: [view: BlogPhoenix.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BlogPhoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
