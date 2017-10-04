defmodule Microblog.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :email, :string
      add :followers, {:array, :string}
      add :following, {:array, :string}

      timestamps()
    end

  end
end
