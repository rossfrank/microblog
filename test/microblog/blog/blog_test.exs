defmodule Microblog.BlogTest do
  use Microblog.DataCase

  alias Microblog.Blog

  describe "messages" do
    alias Microblog.Blog.Message

    @valid_attrs %{hashtags: "some hashtags", likes: 42, mentions: "some mentions", message: "some message", messageID: 42, postingUser: "some postingUser", replies: "some replies", replyOf: 42}
    @update_attrs %{hashtags: "some updated hashtags", likes: 43, mentions: "some updated mentions", message: "some updated message", messageID: 43, postingUser: "some updated postingUser", replies: "some updated replies", replyOf: 43}
    @invalid_attrs %{hashtags: nil, likes: nil, mentions: nil, message: nil, messageID: nil, postingUser: nil, replies: nil, replyOf: nil}

    def message_fixture(attrs \\ %{}) do
      {:ok, message} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blog.create_message()

      message
    end
    @tag :skip
    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Blog.list_messages() == [message]
    end
    @tag :skip
    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Blog.get_message!(message.id) == message
    end
    @tag :skip
    test "create_message/1 with valid data creates a message" do
      assert {:ok, %Message{} = message} = Blog.create_message(@valid_attrs)
      assert message.hashtags == "some hashtags"
      assert message.likes == 42
      assert message.mentions == "some mentions"
      assert message.message == "some message"
      assert message.messageID == 42
      assert message.postingUser == "some postingUser"
      assert message.replies == "some replies"
      assert message.replyOf == 42
    end
    @tag :skip
    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_message(@invalid_attrs)
    end
    @tag :skip
    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      assert {:ok, message} = Blog.update_message(message, @update_attrs)
      assert %Message{} = message
      assert message.hashtags == "some updated hashtags"
      assert message.likes == 43
      assert message.mentions == "some updated mentions"
      assert message.message == "some updated message"
      assert message.messageID == 43
      assert message.postingUser == "some updated postingUser"
      assert message.replies == "some updated replies"
      assert message.replyOf == 43
    end
    @tag :skip
    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_message(message, @invalid_attrs)
      assert message == Blog.get_message!(message.id)
    end
    @tag :skip
    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Blog.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_message!(message.id) end
    end
    @tag :skip
    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Blog.change_message(message)
    end
  end
end
