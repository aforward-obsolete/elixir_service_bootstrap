use Mix.Config

config :elixir_service_bootstrap, ElixirServiceBootstrap.Repo, [
  adapter: Ecto.Adapters.Postgres,
  database: "elixir_service_bootstrap_#{Mix.env}",
  username: "postgres",
  password: "",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox]

config :logger,
  backends: [:console],
  level: :warn,
  compile_time_purge_level: :info