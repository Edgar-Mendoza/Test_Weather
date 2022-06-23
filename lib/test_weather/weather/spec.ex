defmodule TestWeather.Weather.Spec do
  use Ecto.Schema
  import Ecto.Changeset

  schema "specs" do
    field :airline, :string
    field :feels_like, :string
    field :flight_num, :string
    field :humidity, :integer
    field :name, :string
    field :origin_destiny, :string
    field :pressure, :integer
    field :temp, :string
    field :temp_max, :string
    field :temp_min, :string
    field :ticket_id, :id

    timestamps()
  end

  @doc false
  def changeset(spec, attrs) do
    spec
    |> cast(attrs, [:name, :airline, :flight_num, :origin_destiny, :feels_like, :humidity, :pressure, :temp, :temp_max, :temp_min])
    |> validate_required([:name, :airline, :flight_num, :origin_destiny, :feels_like, :humidity, :pressure, :temp, :temp_max, :temp_min])
  end
end
