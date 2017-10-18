defmodule MicroblogWeb.UpdatesChannelTest do
  use MicroblogWeb.ChannelCase

  alias MicroblogWeb.UpdatesChannel

  setup do
    {:ok, _, socket} =
      socket("user_id", %{some: :assign})
      |> subscribe_and_join(UpdatesChannel, "updates:lobby")

    {:ok, socket: socket}
  end
  @tag :skip
  test "ping replies with status ok", %{socket: socket} do
    ref = push socket, "ping", %{"hello" => "there"}
    assert_reply ref, :ok, %{"hello" => "there"}
  end
  @tag :skip
  test "shout broadcasts to updates:lobby", %{socket: socket} do
    push socket, "shout", %{"hello" => "all"}
    assert_broadcast "shout", %{"hello" => "all"}
  end
  @tag :skip
  test "broadcasts are pushed to the client", %{socket: socket} do
    broadcast_from! socket, "broadcast", %{"some" => "data"}
    assert_push "broadcast", %{"some" => "data"}
  end
end
