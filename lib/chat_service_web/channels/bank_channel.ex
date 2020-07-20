defmodule ChatServiceWeb.BankChannel do
  use ChatServiceWeb, :channel
  alias ChatService.Chats

  @impl true
  def join("bank:lobby", _payload, socket) do
    {:ok, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (bank:lobby).
  @impl true
  def handle_in("community", payload, socket) do
    Chats.create_message(payload)
    broadcast socket, "community", payload
    {:noreply, socket}
  end
end
