THIS PROJECT IS OBSOLETE, instead please look at [gen_template_ecto_service](https://raw.githubusercontent.com/aforward/gen_template_ecto_service), which uses an alternative for `mix new`, based on [Dave Thomas'](https://github.com/pragdave/mix_templates) extensible templating engine for creating project templates.

# ElixirServiceBootstrap

Your this repo to bootstrap your elixir service that needs a
Postgres database.  We are using Ecto to manage data migration.

This is a bootstrap project, so the expectation is that you
copy it once, and then rebrand it to your service.

## Installation

First, get a copy of the code, and remove the `.git` directory.

```
git clone git@github.com:aforward/elixir_service_bootstrap.git
```

Let's now rename the project to your service. We will use the `Invoices` as the module name and `invoices` as the OTP (aka atom) name as an example, please rename to your service.

```
MODULE=Invoices OTP=invoices elixir_service_bootstrap/bin/rename
```

If you are pushing this code to Github, then you can also run

```
git remote add origin git@github.com:<username>/<project>.git
git push -u origin master
```

You are now ready to add your Ecto schema and start coding away your service.


## Under The Hood

In case you are interesting, under the hood, the script above will do a bunch fo things.

### Rename project directory

First, it will rename the bootstrap directory to your `OTP` name.

```
rm -rf elixir_service_bootstrap/.git
mv elixir_service_bootstrap ${OTP}
cd ${OTP}
```

### Initialize a new git repo

Second, it will do an initial commit so you can see how your service deivated from the bootstrap.


```
git init
git add .
git commit -m "Initial commit (cloned aforward/elixir_service_bootstrap)"
```

### Rename Project Files

Third it will rebrand the project, and relevant files away from
`elixir_service_bootstrap` and towards `invoices` (change this
for your own needs).

```
mv lib/elixir_service_bootstrap lib/${OTP}
mv lib/elixir_service_bootstrap.ex lib/${OTP}.ex
mv test/elixir_service_bootstrap_test.exs test/${OTP}_test.exs
```


### Rename Module References

Fourth, we will rename any `ElixirServiceBootstrap` to `Invoices` (or whatever your service is called).

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

As well as rename any `elixir_service_bootstrap` to `invoices` (or whatever your service is called).

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

The actual script to do this will be

```
echo "# ${MODULE}\n" >> README.md
find . -name '*.ex' -o -name '*.exs' | xargs sed -i "" 's/elixir_service_bootstrap/$OTP/g'
find . -name '*.ex' -o -name '*.exs' | xargs sed -i "" 's/ElixirServiceBootstrap/$MODULE/g'
```

### Recompile, Test and Commit

Finally, recompile, test and commit the changes


