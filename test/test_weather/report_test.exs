defmodule TestWeather.ReportTest do
  use TestWeather.DataCase

  alias TestWeather.Report

  describe "tickets" do
    alias TestWeather.Report.Ticket

    import TestWeather.ReportFixtures

    @invalid_attrs %{airline: nil, destination: nil, destination_iata_code: nil, destination_latitude: nil, destination_longitude: nil, destination_name: nil, flight_num: nil, origin: nil, origin_iata_code: nil, origin_latitude: nil, origin_longitude: nil, origin_name: nil}

    test "list_tickets/0 returns all tickets" do
      ticket = ticket_fixture()
      assert Report.list_tickets() == [ticket]
    end

    test "get_ticket!/1 returns the ticket with given id" do
      ticket = ticket_fixture()
      assert Report.get_ticket!(ticket.id) == ticket
    end

    test "create_ticket/1 with valid data creates a ticket" do
      valid_attrs = %{airline: "some airline", destination: "some destination", destination_iata_code: "some destination_iata_code", destination_latitude: "some destination_latitude", destination_longitude: "some destination_longitude", destination_name: "some destination_name", flight_num: "some flight_num", origin: "some origin", origin_iata_code: "some origin_iata_code", origin_latitude: "some origin_latitude", origin_longitude: "some origin_longitude", origin_name: "some origin_name"}

      assert {:ok, %Ticket{} = ticket} = Report.create_ticket(valid_attrs)
      assert ticket.airline == "some airline"
      assert ticket.destination == "some destination"
      assert ticket.destination_iata_code == "some destination_iata_code"
      assert ticket.destination_latitude == "some destination_latitude"
      assert ticket.destination_longitude == "some destination_longitude"
      assert ticket.destination_name == "some destination_name"
      assert ticket.flight_num == "some flight_num"
      assert ticket.origin == "some origin"
      assert ticket.origin_iata_code == "some origin_iata_code"
      assert ticket.origin_latitude == "some origin_latitude"
      assert ticket.origin_longitude == "some origin_longitude"
      assert ticket.origin_name == "some origin_name"
    end

    test "create_ticket/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Report.create_ticket(@invalid_attrs)
    end

    test "update_ticket/2 with valid data updates the ticket" do
      ticket = ticket_fixture()
      update_attrs = %{airline: "some updated airline", destination: "some updated destination", destination_iata_code: "some updated destination_iata_code", destination_latitude: "some updated destination_latitude", destination_longitude: "some updated destination_longitude", destination_name: "some updated destination_name", flight_num: "some updated flight_num", origin: "some updated origin", origin_iata_code: "some updated origin_iata_code", origin_latitude: "some updated origin_latitude", origin_longitude: "some updated origin_longitude", origin_name: "some updated origin_name"}

      assert {:ok, %Ticket{} = ticket} = Report.update_ticket(ticket, update_attrs)
      assert ticket.airline == "some updated airline"
      assert ticket.destination == "some updated destination"
      assert ticket.destination_iata_code == "some updated destination_iata_code"
      assert ticket.destination_latitude == "some updated destination_latitude"
      assert ticket.destination_longitude == "some updated destination_longitude"
      assert ticket.destination_name == "some updated destination_name"
      assert ticket.flight_num == "some updated flight_num"
      assert ticket.origin == "some updated origin"
      assert ticket.origin_iata_code == "some updated origin_iata_code"
      assert ticket.origin_latitude == "some updated origin_latitude"
      assert ticket.origin_longitude == "some updated origin_longitude"
      assert ticket.origin_name == "some updated origin_name"
    end

    test "update_ticket/2 with invalid data returns error changeset" do
      ticket = ticket_fixture()
      assert {:error, %Ecto.Changeset{}} = Report.update_ticket(ticket, @invalid_attrs)
      assert ticket == Report.get_ticket!(ticket.id)
    end

    test "delete_ticket/1 deletes the ticket" do
      ticket = ticket_fixture()
      assert {:ok, %Ticket{}} = Report.delete_ticket(ticket)
      assert_raise Ecto.NoResultsError, fn -> Report.get_ticket!(ticket.id) end
    end

    test "change_ticket/1 returns a ticket changeset" do
      ticket = ticket_fixture()
      assert %Ecto.Changeset{} = Report.change_ticket(ticket)
    end
  end
end
