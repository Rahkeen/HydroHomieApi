defmodule HydroHomie.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      HydroHomie.Repo,
      # Start the Telemetry supervisor
      HydroHomieWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: HydroHomie.PubSub},
      # Start the Endpoint (http/https)
      HydroHomieWeb.Endpoint
      # Start a worker by calling: HydroHomie.Worker.start_link(arg)
      # {HydroHomie.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HydroHomie.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    HydroHomieWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
