defmodule TestWeather.WeatherFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TestWeather.Weather` context.
  """

  @doc """
  Generate a spec.
  """
  def spec_fixture(attrs \\ %{}) do
    {:ok, spec} =
      attrs
      |> Enum.into(%{
        airline: "some airline",
        feels_like: "some feels_like",
        flight_num: "some flight_num",
        humidity: "some humidity",
        name: "some name",
        origin_destiny: "some origin_destiny",
        pressure: "some pressure",
        temp: "some temp",
        temp_max: "some temp_max",
        temp_min: "some temp_min"
      })
      |> TestWeather.Weather.create_spec()

    spec
  end
end
