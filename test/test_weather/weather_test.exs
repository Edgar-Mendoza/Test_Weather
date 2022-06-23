defmodule TestWeather.WeatherTest do
  use TestWeather.DataCase

  alias TestWeather.Weather

  describe "specs" do
    alias TestWeather.Weather.Spec

    import TestWeather.WeatherFixtures

    @invalid_attrs %{airline: nil, feels_like: nil, flight_num: nil, humidity: nil, name: nil, origin_destiny: nil, pressure: nil, temp: nil, temp_max: nil, temp_min: nil}

    test "list_specs/0 returns all specs" do
      spec = spec_fixture()
      assert Weather.list_specs() == [spec]
    end

    test "get_spec!/1 returns the spec with given id" do
      spec = spec_fixture()
      assert Weather.get_spec!(spec.id) == spec
    end

    test "create_spec/1 with valid data creates a spec" do
      valid_attrs = %{airline: "some airline", feels_like: "some feels_like", flight_num: "some flight_num", humidity: "some humidity", name: "some name", origin_destiny: "some origin_destiny", pressure: "some pressure", temp: "some temp", temp_max: "some temp_max", temp_min: "some temp_min"}

      assert {:ok, %Spec{} = spec} = Weather.create_spec(valid_attrs)
      assert spec.airline == "some airline"
      assert spec.feels_like == "some feels_like"
      assert spec.flight_num == "some flight_num"
      assert spec.humidity == "some humidity"
      assert spec.name == "some name"
      assert spec.origin_destiny == "some origin_destiny"
      assert spec.pressure == "some pressure"
      assert spec.temp == "some temp"
      assert spec.temp_max == "some temp_max"
      assert spec.temp_min == "some temp_min"
    end

    test "create_spec/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Weather.create_spec(@invalid_attrs)
    end

    test "update_spec/2 with valid data updates the spec" do
      spec = spec_fixture()
      update_attrs = %{airline: "some updated airline", feels_like: "some updated feels_like", flight_num: "some updated flight_num", humidity: "some updated humidity", name: "some updated name", origin_destiny: "some updated origin_destiny", pressure: "some updated pressure", temp: "some updated temp", temp_max: "some updated temp_max", temp_min: "some updated temp_min"}

      assert {:ok, %Spec{} = spec} = Weather.update_spec(spec, update_attrs)
      assert spec.airline == "some updated airline"
      assert spec.feels_like == "some updated feels_like"
      assert spec.flight_num == "some updated flight_num"
      assert spec.humidity == "some updated humidity"
      assert spec.name == "some updated name"
      assert spec.origin_destiny == "some updated origin_destiny"
      assert spec.pressure == "some updated pressure"
      assert spec.temp == "some updated temp"
      assert spec.temp_max == "some updated temp_max"
      assert spec.temp_min == "some updated temp_min"
    end

    test "update_spec/2 with invalid data returns error changeset" do
      spec = spec_fixture()
      assert {:error, %Ecto.Changeset{}} = Weather.update_spec(spec, @invalid_attrs)
      assert spec == Weather.get_spec!(spec.id)
    end

    test "delete_spec/1 deletes the spec" do
      spec = spec_fixture()
      assert {:ok, %Spec{}} = Weather.delete_spec(spec)
      assert_raise Ecto.NoResultsError, fn -> Weather.get_spec!(spec.id) end
    end

    test "change_spec/1 returns a spec changeset" do
      spec = spec_fixture()
      assert %Ecto.Changeset{} = Weather.change_spec(spec)
    end
  end
end
