defmodule Phooey.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhooeyWeb.Telemetry,
      Phooey.Repo,
      {DNSCluster, query: Application.get_env(:phooey, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Phooey.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Phooey.Finch},
      # Start a worker by calling: Phooey.Worker.start_link(arg)
      # {Phooey.Worker, arg},
      # Start to serve requests, typically the last entry
      PhooeyWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Phooey.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhooeyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
