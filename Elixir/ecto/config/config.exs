import Config

config :example, ecto_repos: [Example.Repo]

config :example, Example.Repo,
  database: "db.sqlite",
  journal_mode: :off

config :logger,
  level: :info
