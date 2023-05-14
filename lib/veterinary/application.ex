defmodule Veterinary.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      VeterinaryWeb.Telemetry,
      # Start the Ecto repository
      Veterinary.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Veterinary.PubSub},
      # Start the Endpoint (http/https)
      VeterinaryWeb.Endpoint
      # Start a worker by calling: Veterinary.Worker.start_link(arg)
      # {Veterinary.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Veterinary.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    VeterinaryWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
