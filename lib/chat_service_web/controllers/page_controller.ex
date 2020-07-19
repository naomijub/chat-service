defmodule ChatServiceWeb.PageController do
  use ChatServiceWeb, :controller
  alias ChatService.Chats

  def index(conn, _params) do
    previous_messages = Chats.list_messages()
    render(conn, "index.html", messages: previous_messages)
  end
end
