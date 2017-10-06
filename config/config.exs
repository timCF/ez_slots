# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ez_slots,
  ecto_repos: [EzSlots.Repo]

# Configures the endpoint
config :ez_slots, EzSlotsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Q6sM+QTcJIT+wW6jD4947KBrOyr0V2fzW7QxXfaIRnWjAWy1OjA+o3Qo18sr8CXK",
  render_errors: [view: EzSlotsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: EzSlots.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
