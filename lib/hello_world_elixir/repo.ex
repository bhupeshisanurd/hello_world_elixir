defmodule HelloWorldElixir.Repo do
  use Ecto.Repo,
    otp_app: :hello_world_elixir,
    adapter: Ecto.Adapters.Postgres
end
