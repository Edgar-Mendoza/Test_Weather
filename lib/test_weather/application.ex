defmodule TestWeather.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      TestWeather.Repo,
      # Start the Telemetry supervisor
      TestWeatherWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: TestWeather.PubSub},
      # Start the Endpoint (http/https)
      TestWeatherWeb.Endpoint
      # Start a worker by calling: TestWeather.Worker.start_link(arg)
      # {TestWeather.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TestWeather.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TestWeatherWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
