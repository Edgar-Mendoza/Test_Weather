defmodule TestWeather.Repo.Migrations.CreateTickets do
  use Ecto.Migration

  def change do
    create table(:tickets) do
      add :origin, :string
      add :destination, :string
      add :airline, :string
      add :flight_num, :string
      add :origin_iata_code, :string
      add :origin_name, :string
      add :origin_latitude, :string
      add :origin_longitude, :string
      add :destination_iata_code, :string
      add :destination_name, :string
      add :destination_latitude, :string
      add :destination_longitude, :string

      timestamps()
    end
  end
end
