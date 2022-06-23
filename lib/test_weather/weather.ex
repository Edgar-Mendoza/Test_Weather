defmodule TestWeather.Weather do
  @moduledoc """
  The Weather context.
  """

  import Ecto.Query, warn: false
  alias TestWeather.Repo

  alias TestWeather.Weather.Spec

  @doc """
  Returns the list of specs.

  ## Examples

      iex> list_specs()
      [%Spec{}, ...]

  """
  def list_specs do
    Repo.all(Spec)
  end

  @doc """
  Gets a single spec.

  Raises `Ecto.NoResultsError` if the Spec does not exist.

  ## Examples

      iex> get_spec!(123)
      %Spec{}

      iex> get_spec!(456)
      ** (Ecto.NoResultsError)

  """
  def get_spec!(id), do: Repo.get!(Spec, id)

  @doc """
  Creates a spec.

  ## Examples

      iex> create_spec(%{field: value})
      {:ok, %Spec{}}

      iex> create_spec(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_spec(attrs \\ %{}) do
    %Spec{}
    |> Spec.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a spec.

  ## Examples

      iex> update_spec(spec, %{field: new_value})
      {:ok, %Spec{}}

      iex> update_spec(spec, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_spec(%Spec{} = spec, attrs) do
    spec
    |> Spec.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a spec.

  ## Examples

      iex> delete_spec(spec)
      {:ok, %Spec{}}

      iex> delete_spec(spec)
      {:error, %Ecto.Changeset{}}

  """
  def delete_spec(%Spec{} = spec) do
    Repo.delete(spec)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking spec changes.

  ## Examples

      iex> change_spec(spec)
      %Ecto.Changeset{data: %Spec{}}

  """
  def change_spec(%Spec{} = spec, attrs \\ %{}) do
    Spec.changeset(spec, attrs)
  end

  def insert_weather(items) do
    Spec
      |> Repo.insert_all(items, on_conflict: :nothing, returning: true)
  end

  def order_by() do
    specs = from Spec,
      order_by: [asc: :ticket_id],
      select: [
        :name,
        :airline,
        :flight_num,
        :origin_destiny,
        :feels_like, :humidity,
        :pressure,
        :temp,
        :temp_max,
        :temp_min
      ]
    Repo.all(specs)
  end
end
