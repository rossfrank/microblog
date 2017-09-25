defmodule Microblog.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :postingUser, :string
      add :messageID, :integer
      add :message, :string
      add :likes, :integer
      add :replies, :string
      add :replyOf, :integer
      add :hashtags, :string
      add :mentions, :string

      timestamps()
    end

  end
end
