defmodule Microblog.Blog.Message do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Blog.Message


  schema "messages" do
    field :hashtags, :string, default: "none"
    field :likes, :integer, default: 0
    field :mentions, :string, default: "none"
    field :message, :string
    field :messageID, :integer, default: 0
    field :postingUser, :string
    field :replies, :string, default: "none"
    field :replyOf, :integer, default: 0

    timestamps()
  end

  @doc false
  def changeset(%Message{} = message, attrs) do
    message
    |> cast(attrs, [:postingUser, :messageID, :message, :likes, :replies, :replyOf, :hashtags, :mentions])
    |> validate_required([:postingUser, :messageID, :message, :likes, :replies, :replyOf, :hashtags, :mentions])
  end
end
