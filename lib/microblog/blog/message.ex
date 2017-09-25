defmodule Microblog.Blog.Message do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Blog.Message


  schema "messages" do
    field :hashtags, :string
    field :likes, :integer
    field :mentions, :string
    field :message, :string
    field :messageID, :integer
    field :postingUser, :string
    field :replies, :string
    field :replyOf, :integer

    timestamps()
  end

  @doc false
  def changeset(%Message{} = message, attrs) do
    message
    |> cast(attrs, [:postingUser, :messageID, :message, :likes, :replies, :replyOf, :hashtags, :mentions])
    |> validate_required([:postingUser, :messageID, :message, :likes, :replies, :replyOf, :hashtags, :mentions])
  end
end
