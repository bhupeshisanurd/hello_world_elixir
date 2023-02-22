defmodule HelloWorldElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      HelloWorldElixir.Repo,
      # Start the Telemetry supervisor
      HelloWorldElixirWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: HelloWorldElixir.PubSub},
      # Start the Endpoint (http/https)
      HelloWorldElixirWeb.Endpoint
      # Start a worker by calling: HelloWorldElixir.Worker.start_link(arg)
      # {HelloWorldElixir.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HelloWorldElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HelloWorldElixirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
