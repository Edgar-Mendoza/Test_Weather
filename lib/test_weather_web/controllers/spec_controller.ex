defmodule TestWeatherWeb.SpecController do
  use TestWeatherWeb, :controller

  alias TestWeather.Weather
  alias TestWeather.Weather.Spec
  # alias TestWeather.Report
  alias TestWeather.WeatherFunctions

  def index(conn, _params) do

    specs = WeatherFunctions.save_all()
    render(conn, "index.html", specs: specs)
  end

  def new(conn, _params) do
    changeset = Weather.change_spec(%Spec{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"spec" => spec_params}) do
    case Weather.create_spec(spec_params) do
      {:ok, spec} ->
        conn
        |> put_flash(:info, "Spec created successfully.")
        |> redirect(to: Routes.spec_path(conn, :show, spec))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    spec = Weather.get_spec!(id)
    render(conn, "show.html", spec: spec)
  end

  def edit(conn, %{"id" => id}) do
    spec = Weather.get_spec!(id)
    changeset = Weather.change_spec(spec)
    render(conn, "edit.html", spec: spec, changeset: changeset)
  end

  def update(conn, %{"id" => id, "spec" => spec_params}) do
    spec = Weather.get_spec!(id)

    case Weather.update_spec(spec, spec_params) do
      {:ok, spec} ->
        conn
        |> put_flash(:info, "Spec updated successfully.")
        |> redirect(to: Routes.spec_path(conn, :show, spec))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", spec: spec, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    spec = Weather.get_spec!(id)
    {:ok, _spec} = Weather.delete_spec(spec)

    conn
    |> put_flash(:info, "Spec deleted successfully.")
    |> redirect(to: Routes.spec_path(conn, :index))
  end
end
