defmodule TestWeatherWeb.PageController do
  use TestWeatherWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
