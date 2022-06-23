defmodule TestWeather.ReportFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TestWeather.Report` context.
  """

  @doc """
  Generate a ticket.
  """
  def ticket_fixture(attrs \\ %{}) do
    {:ok, ticket} =
      attrs
      |> Enum.into(%{
        airline: "some airline",
        destination: "some destination",
        destination_iata_code: "some destination_iata_code",
        destination_latitude: "some destination_latitude",
        destination_longitude: "some destination_longitude",
        destination_name: "some destination_name",
        flight_num: "some flight_num",
        origin: "some origin",
        origin_iata_code: "some origin_iata_code",
        origin_latitude: "some origin_latitude",
        origin_longitude: "some origin_longitude",
        origin_name: "some origin_name"
      })
      |> TestWeather.Report.create_ticket()

    ticket
  end
end
