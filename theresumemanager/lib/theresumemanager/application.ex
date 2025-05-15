defmodule Theresumemanager.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TheresumemanagerWeb.Telemetry,
      Theresumemanager.Repo,
      {DNSCluster, query: Application.get_env(:theresumemanager, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Theresumemanager.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Theresumemanager.Finch},
      # Start a worker by calling: Theresumemanager.Worker.start_link(arg)
      # {Theresumemanager.Worker, arg},
      # Start to serve requests, typically the last entry
      TheresumemanagerWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Theresumemanager.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TheresumemanagerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
