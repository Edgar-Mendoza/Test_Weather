defmodule TestWeatherWeb.TicketController do
  use TestWeatherWeb, :controller

  alias TestWeather.Report
  alias TestWeather.Report.Ticket

  def index(conn, _params) do
    tickets = Report.list_tickets()
    render(conn, "index.html", tickets: tickets)
  end

  def new(conn, _params) do
    changeset = Report.change_ticket(%Ticket{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"ticket" => ticket_params}) do
    case Report.create_ticket(ticket_params) do
      {:ok, ticket} ->
        conn
        |> put_flash(:info, "Ticket created successfully.")
        |> redirect(to: Routes.ticket_path(conn, :show, ticket))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    ticket = Report.get_ticket!(id)
    render(conn, "show.html", ticket: ticket)
  end

  def edit(conn, %{"id" => id}) do
    ticket = Report.get_ticket!(id)
    changeset = Report.change_ticket(ticket)
    render(conn, "edit.html", ticket: ticket, changeset: changeset)
  end

  def update(conn, %{"id" => id, "ticket" => ticket_params}) do
    ticket = Report.get_ticket!(id)

    case Report.update_ticket(ticket, ticket_params) do
      {:ok, ticket} ->
        conn
        |> put_flash(:info, "Ticket updated successfully.")
        |> redirect(to: Routes.ticket_path(conn, :show, ticket))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", ticket: ticket, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    ticket = Report.get_ticket!(id)
    {:ok, _ticket} = Report.delete_ticket(ticket)

    conn
    |> put_flash(:info, "Ticket deleted successfully.")
    |> redirect(to: Routes.ticket_path(conn, :index))
  end

  def import(conn, %{"csv" => csv}) do
    data = csv_decoder(csv)
    import_tickets(data)

    conn
      |> put_flash(:info, "Tickets importados exitosamente!")
      |> redirect(to: Routes.ticket_path(conn, :index))
  end

  defp csv_decoder(file) do
    "#{file.path}"
      |> Path.expand(__DIR__)
      |> File.stream!()
      |> CSV.decode(headers: true)
      |> Enum.map(fn data -> data end)
  end

  def import_tickets(data) do
    tickets = Enum.map(data, fn {:ok, ticket} -> parse(ticket) end)
    params = Report.convert_params(tickets)

    {_, _} = Report.insert_tickets(params)
  end

  defp parse(ticket) do
    Report.parse_fields(ticket)
  end
end
