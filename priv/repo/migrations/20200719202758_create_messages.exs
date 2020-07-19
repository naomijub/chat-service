defmodule ChatService.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :user, :string
      add :body, :text

      timestamps()
    end

  end
end
