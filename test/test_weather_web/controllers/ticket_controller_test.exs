defmodule TestWeatherWeb.TicketControllerTest do
  use TestWeatherWeb.ConnCase

  import TestWeather.ReportFixtures

  @create_attrs %{airline: "some airline", destination: "some destination", destination_iata_code: "some destination_iata_code", destination_latitude: "some destination_latitude", destination_longitude: "some destination_longitude", destination_name: "some destination_name", flight_num: "some flight_num", origin: "some origin", origin_iata_code: "some origin_iata_code", origin_latitude: "some origin_latitude", origin_longitude: "some origin_longitude", origin_name: "some origin_name"}
  @update_attrs %{airline: "some updated airline", destination: "some updated destination", destination_iata_code: "some updated destination_iata_code", destination_latitude: "some updated destination_latitude", destination_longitude: "some updated destination_longitude", destination_name: "some updated destination_name", flight_num: "some updated flight_num", origin: "some updated origin", origin_iata_code: "some updated origin_iata_code", origin_latitude: "some updated origin_latitude", origin_longitude: "some updated origin_longitude", origin_name: "some updated origin_name"}
  @invalid_attrs %{airline: nil, destination: nil, destination_iata_code: nil, destination_latitude: nil, destination_longitude: nil, destination_name: nil, flight_num: nil, origin: nil, origin_iata_code: nil, origin_latitude: nil, origin_longitude: nil, origin_name: nil}

  describe "index" do
    test "lists all tickets", %{conn: conn} do
      conn = get(conn, Routes.ticket_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Tickets"
    end
  end

  describe "new ticket" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.ticket_path(conn, :new))
      assert html_response(conn, 200) =~ "New Ticket"
    end
  end

  describe "create ticket" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.ticket_path(conn, :create), ticket: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.ticket_path(conn, :show, id)

      conn = get(conn, Routes.ticket_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Ticket"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.ticket_path(conn, :create), ticket: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Ticket"
    end
  end

  describe "edit ticket" do
    setup [:create_ticket]

    test "renders form for editing chosen ticket", %{conn: conn, ticket: ticket} do
      conn = get(conn, Routes.ticket_path(conn, :edit, ticket))
      assert html_response(conn, 200) =~ "Edit Ticket"
    end
  end

  describe "update ticket" do
    setup [:create_ticket]

    test "redirects when data is valid", %{conn: conn, ticket: ticket} do
      conn = put(conn, Routes.ticket_path(conn, :update, ticket), ticket: @update_attrs)
      assert redirected_to(conn) == Routes.ticket_path(conn, :show, ticket)

      conn = get(conn, Routes.ticket_path(conn, :show, ticket))
      assert html_response(conn, 200) =~ "some updated airline"
    end

    test "renders errors when data is invalid", %{conn: conn, ticket: ticket} do
      conn = put(conn, Routes.ticket_path(conn, :update, ticket), ticket: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Ticket"
    end
  end

  describe "delete ticket" do
    setup [:create_ticket]

    test "deletes chosen ticket", %{conn: conn, ticket: ticket} do
      conn = delete(conn, Routes.ticket_path(conn, :delete, ticket))
      assert redirected_to(conn) == Routes.ticket_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.ticket_path(conn, :show, ticket))
      end
    end
  end

  defp create_ticket(_) do
    ticket = ticket_fixture()
    %{ticket: ticket}
  end
end
