defmodule TestWeatherWeb.SpecControllerTest do
  use TestWeatherWeb.ConnCase

  import TestWeather.WeatherFixtures

  @create_attrs %{airline: "some airline", feels_like: "some feels_like", flight_num: "some flight_num", humidity: "some humidity", name: "some name", origin_destiny: "some origin_destiny", pressure: "some pressure", temp: "some temp", temp_max: "some temp_max", temp_min: "some temp_min"}
  @update_attrs %{airline: "some updated airline", feels_like: "some updated feels_like", flight_num: "some updated flight_num", humidity: "some updated humidity", name: "some updated name", origin_destiny: "some updated origin_destiny", pressure: "some updated pressure", temp: "some updated temp", temp_max: "some updated temp_max", temp_min: "some updated temp_min"}
  @invalid_attrs %{airline: nil, feels_like: nil, flight_num: nil, humidity: nil, name: nil, origin_destiny: nil, pressure: nil, temp: nil, temp_max: nil, temp_min: nil}

  describe "index" do
    test "lists all specs", %{conn: conn} do
      conn = get(conn, Routes.spec_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Specs"
    end
  end

  describe "new spec" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.spec_path(conn, :new))
      assert html_response(conn, 200) =~ "New Spec"
    end
  end

  describe "create spec" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.spec_path(conn, :create), spec: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.spec_path(conn, :show, id)

      conn = get(conn, Routes.spec_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Spec"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.spec_path(conn, :create), spec: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Spec"
    end
  end

  describe "edit spec" do
    setup [:create_spec]

    test "renders form for editing chosen spec", %{conn: conn, spec: spec} do
      conn = get(conn, Routes.spec_path(conn, :edit, spec))
      assert html_response(conn, 200) =~ "Edit Spec"
    end
  end

  describe "update spec" do
    setup [:create_spec]

    test "redirects when data is valid", %{conn: conn, spec: spec} do
      conn = put(conn, Routes.spec_path(conn, :update, spec), spec: @update_attrs)
      assert redirected_to(conn) == Routes.spec_path(conn, :show, spec)

      conn = get(conn, Routes.spec_path(conn, :show, spec))
      assert html_response(conn, 200) =~ "some updated airline"
    end

    test "renders errors when data is invalid", %{conn: conn, spec: spec} do
      conn = put(conn, Routes.spec_path(conn, :update, spec), spec: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Spec"
    end
  end

  describe "delete spec" do
    setup [:create_spec]

    test "deletes chosen spec", %{conn: conn, spec: spec} do
      conn = delete(conn, Routes.spec_path(conn, :delete, spec))
      assert redirected_to(conn) == Routes.spec_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.spec_path(conn, :show, spec))
      end
    end
  end

  defp create_spec(_) do
    spec = spec_fixture()
    %{spec: spec}
  end
end
