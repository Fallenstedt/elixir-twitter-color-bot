# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# 3rd-party users, it should be done in your "mix.exs" file.

# You can configure for your application as:
#
#     config :twitter_color, key: :value
#
# And access this configuration in your application as:
#
#     Application.get_env(:twitter_color, :key)
#
# Or configure a 3rd-party app:
#
#     config :logger, level: :info
#

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env}.exs"
# Generate an image every hour on the 10 mark and posts it to twitter
config :quantum, :your_app,
  cron: [
    # Every hour at the 25 mark.
    "21 * * * *": {TwitterColor, :main}
  ]

config :extwitter, :oauth,
  consumer_key: System.get_env("CONSUMER_KEY"),
  consumer_secret: System.get_env("CONSUMER_SECRET"),
  access_token: System.get_env("ACCESS_TOKEN"),
  access_token_secret: System.get_env("ACCESS_TOKEN_SECRET")
