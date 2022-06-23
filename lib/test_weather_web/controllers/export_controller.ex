defmodule TestWeatherWeb.ExportController do
  use TestWeatherWeb, :controller

  def create(conn, _params) do
    fields = [:name, :airline, :flight_num, :origin_destiny, :feels_like, :humidity, :pressure, :temp, :temp_max, :temp_min]
    csv_data = csv_content(TestWeather.Weather.order_by, fields)

    conn
    |> put_resp_content_type("text/csv")
    |> put_resp_header("content-disposition", "attachment; filename=\"clima_dataset.csv\"")
    |> put_root_layout(false)
    |> send_resp(200, csv_data)
  end

  defp csv_content(records, fields) do
    records
    |> Enum.map(fn record ->
      record
      |> Map.from_struct()
      |> Map.take([]) # gives an empty map
      |> Map.merge( Map.take(record, fields) )
      |> Map.values()
    end)
    |> CSV.encode()
    |> Enum.to_list()
    |> to_string()
  end
end
