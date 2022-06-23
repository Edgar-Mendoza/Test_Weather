defmodule TestWeather.Repo.Migrations.CreateSpecs do
  use Ecto.Migration

  def change do
    create table(:specs) do
      add :name, :string
      add :airline, :string
      add :flight_num, :string
      add :origin_destiny, :string
      add :feels_like, :string
      add :humidity, :integer
      add :pressure, :integer
      add :temp, :string
      add :temp_max, :string
      add :temp_min, :string
      add :ticket_id, references(:tickets, on_delete: :nothing)

      timestamps()
    end

    create index(:specs, [:ticket_id])
  end
end
