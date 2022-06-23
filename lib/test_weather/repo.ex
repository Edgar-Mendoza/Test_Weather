defmodule TestWeather.Repo do
  use Ecto.Repo,
    otp_app: :test_weather,
    adapter: Ecto.Adapters.Postgres
end
