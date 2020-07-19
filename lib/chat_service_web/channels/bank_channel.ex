defmodule ChatServiceWeb.BankChannel do
  use ChatServiceWeb, :channel
  alias ChatService.Chats

  @impl true
  def join("bank:lobby", payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  @impl true
  def handle_in("transact", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (bank:lobby).
  @impl true
  def handle_in("community", payload, socket) do
    Chats.create_message(payload)
    broadcast socket, "community", payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
