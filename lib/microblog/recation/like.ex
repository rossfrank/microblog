defmodule Microblog.Recation.Like do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Recation.Like


  schema "likes" do
    field :message_id, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Like{} = like, attrs) do
    like
    |> cast(attrs, [])
    |> validate_required([])
  end
end
