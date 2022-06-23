defmodule TestWeather.WeatherFunctions do

  alias TestWeather.Report
  alias TestWeather.Weather

  def save_all() do
    # origin =
    Report.list_tickets()
      |> Enum.map(fn ticket -> get_weather_origin(ticket) end)
      |> List.flatten()

    # destiny =
    Report.list_tickets()
      |> Enum.map(fn ticket -> get_weather_destiny(ticket) end)
      |> List.flatten()

    # origin ++ destiny
    Weather.order_by()
  end

  def get_weather_origin(ticket) do
    origin = ExOwm.get_current_weather([%{lat: ticket.origin_latitude, lon: ticket.origin_longitude}], units: :metric, lang: :pl)
      |> Enum.map(fn wet -> wet |> get_info_processed(ticket.id, ticket.airline, ticket.flight_num, "Origin", ticket.inserted_at, ticket.updated_at) end)

    origin
      |> Weather.insert_weather()

    origin
  end

  def get_weather_destiny(ticket) do
    destiny = ExOwm.get_current_weather([%{lat: ticket.destination_latitude, lon: ticket.destination_longitude}], units: :metric, lang: :pl)
      |> Enum.map(fn wet -> wet |> get_info_processed(ticket.id, ticket.airline, ticket.flight_num, "Destiny", ticket.inserted_at, ticket.updated_at) end)

    destiny
      |> Weather.insert_weather()

    destiny
  end

  def get_info_processed({:ok, info}, ticket_id, ticket_airline, ticket_flight_num, message, ticket_inserted_at, ticket_update_at) do
      %{
      ticket_id: ticket_id,
      name: info["name"],
      airline: ticket_airline,
      flight_num: ticket_flight_num,
      origin_destiny: message,
      feels_like: to_string(info["main"]["feels_like"]),
      humidity: info["main"]["humidity"],
      pressure: info["main"]["pressure"],
      temp: to_string(info["main"]["temp"]),
      temp_max: to_string(info["main"]["temp_max"]),
      temp_min: to_string(info["main"]["temp_min"]),
      inserted_at: ticket_inserted_at,
      updated_at: ticket_update_at
    }
  end

  def get_info_processed(_) do
    Map.new()
  end
end
