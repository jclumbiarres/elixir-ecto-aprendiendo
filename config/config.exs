import Config

config :todolistex,
  ecto_repos: [DataCollector.Repo]

config :todolistex, DataCollector.Repo,
  database: Path.expand("../todolistex_#{Mix.env()}.db", Path.dirname(__ENV__.file)),
  pool_size: 5
