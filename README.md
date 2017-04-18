# ElixirServiceBootstrap

Your this repo to bootstrap your elixir service that needs a
Postgres database.  We are using Ecto to manage data migration.

This is a bootstrap project, so the expectation is that you
copy it once, and then rebrand it to your service.

## Installation

For the installation, we will show how to rebrand to create
an `Invoices` service.


### Clone the Repo

First, get a copy of the code, and remove the `.git` directory.

```
git clone git@github.com:aforward/elixir_service_bootstrap.git
rm -rf elixir_service_bootstrap/.git
```

### Rename Project Files

Let's now rebrand the project, and relevant files away from
`elixir_service_bootstrap` and towards `invoices` (change this
for your own needs).

```
mv elixir_service_bootstrap invoices
cd invoices
mv lib/elixir_service_bootstrap lib/invoices
mv lib/elixir_service_bootstrap.ex lib/invoices.ex
mv test/elixir_service_bootstrap_test.exs test/invoices_test.exs
```

### Rename Module References

Now let's rename any `ElixirServiceBootstrap` to `Invoices` (or whatever your service is called).

```
Searching 16 files for "ElixirServiceBootstrap" (case sensitive)

/private/tmp/invoices/mix.exs:
    1: defmodule ElixirServiceBootstrap.Mixfile do
    .
   16:      mod: {ElixirServiceBootstrap.Application, []}]

/private/tmp/invoices/README.md:
    1: # ElixirServiceBootstrap

/private/tmp/invoices/config/config.exs:
    5: config :elixir_service_bootstrap, ecto_repos: [ElixirServiceBootstrap.Repo]

/private/tmp/invoices/config/dev.exs:
    3: config :elixir_service_bootstrap, ElixirServiceBootstrap.Repo, [

/private/tmp/invoices/config/test.exs:
    3: config :elixir_service_bootstrap, ElixirServiceBootstrap.Repo, [

/private/tmp/invoices/lib/invoices.ex:
    1: defmodule ElixirServiceBootstrap do
    2    @moduledoc """
    3:   Documentation for ElixirServiceBootstrap.
    .
   11:       iex> ElixirServiceBootstrap.hello

/private/tmp/invoices/lib/invoices/action.ex:
    1: defmodule ElixirServiceBootstrap.Action do
    .
    6:   alias ElixirServiceBootstrap.{Action,Repo}

/private/tmp/invoices/lib/invoices/application.ex:
    1: defmodule ElixirServiceBootstrap.Application do
    .
   13:       # Starts a worker by calling: ElixirServiceBootstrap.Worker.start_link(arg1, arg2, arg3)
   14:       worker(ElixirServiceBootstrap.Repo, []),
    .
   19:     opts = [strategy: :one_for_one, name: ElixirServiceBootstrap.Supervisor]

/private/tmp/invoices/lib/invoices/repo.ex:
    1: defmodule ElixirServiceBootstrap.Repo do

/private/tmp/invoices/priv/repo/migrations/20170418164826_create_actions.exs:
    1: defmodule ElixirServiceBootstrap.Repo.Migrations.CreateActions do

/private/tmp/invoices/test/action_test.exs:
    1: defmodule ElixirServiceBootstrap.ActionTest do
    .
    4:   alias ElixirServiceBootstrap.{Action, Repo}
    5:   doctest ElixirServiceBootstrap.Action

/private/tmp/invoices/test/invoices_test.exs:
    1: defmodule ElixirServiceBootstrapTest do
    .
    3:   doctest ElixirServiceBootstrap

22 matches across 12 files
```

The exact number of matches might vary, but in general a global search and replace should work just fine.

### Rename atom references

Now let's rename any `elixir_service_bootstrap` to `invoices` (or whatever your service is called).

```
Searching 16 files for "elixir_service_bootstrap" (case sensitive)

/private/tmp/invoices/mix.exs:
    3  
    4    def project do
    5:     [app: :elixir_service_bootstrap,
 
/private/tmp/invoices/config/config.exs:
    5: config :elixir_service_bootstrap, ecto_repos: [Invoices.Repo]
    .
   22: #     config :elixir_service_bootstrap, key: :value
    .
   26: #     Application.get_env(:elixir_service_bootstrap, :key)

/private/tmp/invoices/config/dev.exs:
    3: config :elixir_service_bootstrap, Invoices.Repo, [
    .
    5:   database: "elixir_service_bootstrap_#{Mix.env}",

/private/tmp/invoices/config/test.exs:
    3: config :elixir_service_bootstrap, Invoices.Repo, [
    .
    5:   database: "elixir_service_bootstrap_#{Mix.env}",

/private/tmp/invoices/lib/invoices/repo.ex:
    2:   use Ecto.Repo, otp_app: :elixir_service_bootstrap
    
9 matches across 5 files    
```

The exact number of matches might vary, but in general a global search and replace should work just fine.
