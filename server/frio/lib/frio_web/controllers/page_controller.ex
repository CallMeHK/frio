defmodule FrioWeb.PageController do
  use FrioWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
