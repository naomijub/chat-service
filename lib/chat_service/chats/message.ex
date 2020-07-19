defmodule ChatService.Chats.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :body, :string
    field :user, :string

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:user, :body])
    |> validate_required([:user, :body])
  end
end
