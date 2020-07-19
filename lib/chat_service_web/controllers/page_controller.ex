defmodule ChatServiceWeb.PageController do
  use ChatServiceWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
