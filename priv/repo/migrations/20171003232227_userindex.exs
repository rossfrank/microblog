defmodule Microblog.Repo.Migrations.Userindex do
  use Ecto.Migration

  def change do
    create index("users", [:username])
  end
end
