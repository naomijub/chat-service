# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :chat_service,
  ecto_repos: [ChatService.Repo]

# Configures the endpoint
config :chat_service, ChatServiceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "f+dVBN6kW/6TtJ5ri3loZfeKH7G/QPvU1htsu9E7rz5vjjErFVkqnAgZLumEU6ge",
  render_errors: [view: ChatServiceWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ChatService.PubSub,
  live_view: [signing_salt: "Oipl6sH1"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
