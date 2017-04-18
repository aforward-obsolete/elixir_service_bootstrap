use Mix.Config

config :elixir_service_bootstrap, ElixirServiceBootstrap.Repo, [
  adapter: Ecto.Adapters.Postgres,
  database: "elixir_service_bootstrap_#{Mix.env}",
  username: "postgres",
  password: "",
  hostname: "localhost",
]