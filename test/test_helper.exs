ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Conds.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Conds.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Conds.Repo)

