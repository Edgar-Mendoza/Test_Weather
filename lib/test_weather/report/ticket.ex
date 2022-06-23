defmodule TestWeather.Report.Ticket do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tickets" do
    field :airline, :string
    field :destination, :string
    field :destination_iata_code, :string
    field :destination_latitude, :string
    field :destination_longitude, :string
    field :destination_name, :string
    field :flight_num, :string
    field :origin, :string
    field :origin_iata_code, :string
    field :origin_latitude, :string
    field :origin_longitude, :string
    field :origin_name, :string

    timestamps()
  end

  @doc false
  def changeset(ticket, attrs) do
    ticket
    |> cast(attrs, [:origin, :destination, :airline, :flight_num, :origin_iata_code, :origin_name, :origin_latitude, :origin_longitude, :destination_iata_code, :destination_name, :destination_latitude, :destination_longitude])
    |> validate_required([:origin, :destination, :airline, :flight_num, :origin_iata_code, :origin_name, :origin_latitude, :origin_longitude, :destination_iata_code, :destination_name, :destination_latitude, :destination_longitude])
  end
end
