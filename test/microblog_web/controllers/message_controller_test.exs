defmodule MicroblogWeb.MessageControllerTest do
  use MicroblogWeb.ConnCase

  alias Microblog.Blog

  @create_attrs %{hashtags: "some hashtags", likes: 42, mentions: "some mentions", message: "some message", messageID: 42, postingUser: "some postingUser", replies: "some replies", replyOf: 42}
  @update_attrs %{hashtags: "some updated hashtags", likes: 43, mentions: "some updated mentions", message: "some updated message", messageID: 43, postingUser: "some updated postingUser", replies: "some updated replies", replyOf: 43}
  @invalid_attrs %{hashtags: nil, likes: nil, mentions: nil, message: nil, messageID: nil, postingUser: nil, replies: nil, replyOf: nil}

  def fixture(:message) do
    {:ok, message} = Blog.create_message(@create_attrs)
    message
  end
  @tag :skip
  describe "index" do
    test "lists all messages", %{conn: conn} do
      conn = get conn, message_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Messages"
    end
  end
  @tag :skip
  describe "new message" do
    test "renders form", %{conn: conn} do
      conn = get conn, message_path(conn, :new)
      assert html_response(conn, 200) =~ "New Message"
    end
  end
  @tag :skip
  describe "create message" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, message_path(conn, :create), message: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == message_path(conn, :show, id)

      conn = get conn, message_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Message"
    end
    @tag :skip
    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, message_path(conn, :create), message: @invalid_attrs
      assert html_response(conn, 200) =~ "New Message"
    end
  end

  describe "edit message" do
    setup [:create_message]
    @tag :skip
    test "renders form for editing chosen message", %{conn: conn, message: message} do
      conn = get conn, message_path(conn, :edit, message)
      assert html_response(conn, 200) =~ "Edit Message"
    end
  end

  describe "update message" do
    setup [:create_message]
    @tag :skip
    test "redirects when data is valid", %{conn: conn, message: message} do
      conn = put conn, message_path(conn, :update, message), message: @update_attrs
      assert redirected_to(conn) == message_path(conn, :show, message)

      conn = get conn, message_path(conn, :show, message)
      assert html_response(conn, 200) =~ "some updated hashtags"
    end
    @tag :skip
    test "renders errors when data is invalid", %{conn: conn, message: message} do
      conn = put conn, message_path(conn, :update, message), message: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Message"
    end
  end

  describe "delete message" do
    setup [:create_message]
    @tag :skip
    test "deletes chosen message", %{conn: conn, message: message} do
      conn = delete conn, message_path(conn, :delete, message)
      assert redirected_to(conn) == message_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, message_path(conn, :show, message)
      end
    end
  end

  defp create_message(_) do
    message = fixture(:message)
    {:ok, message: message}
  end
end
