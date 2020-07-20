defmodule ChatServiceWeb.CommunityChannel do
  use ChatServiceWeb, :channel
  alias ChatService.Chats

  @impl true
  def join("community:lobby", _payload, socket) do
    {:ok, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (community:lobby).
  @impl true
  def handle_in("community", payload, socket) do
    Chats.create_message(payload)
    broadcast socket, "community", payload
    {:noreply, socket}
  end
end
