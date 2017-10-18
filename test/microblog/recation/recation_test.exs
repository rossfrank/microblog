defmodule Microblog.RecationTest do
  use Microblog.DataCase

  alias Microblog.Recation

  describe "likes" do
    alias Microblog.Recation.Like

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def like_fixture(attrs \\ %{}) do
      {:ok, like} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Recation.create_like()

      like
    end
    @tag :skip
    test "list_likes/0 returns all likes" do
      like = like_fixture()
      assert Recation.list_likes() == [like]
    end
    @tag :skip
    test "get_like!/1 returns the like with given id" do
      like = like_fixture()
      assert Recation.get_like!(like.id) == like
    end
    @tag :skip
    test "create_like/1 with valid data creates a like" do
      assert {:ok, %Like{} = like} = Recation.create_like(@valid_attrs)
    end
    @tag :skip
    test "create_like/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Recation.create_like(@invalid_attrs)
    end
    @tag :skip
    test "update_like/2 with valid data updates the like" do
      like = like_fixture()
      assert {:ok, like} = Recation.update_like(like, @update_attrs)
      assert %Like{} = like
    end
    @tag :skip
    test "update_like/2 with invalid data returns error changeset" do
      like = like_fixture()
      assert {:error, %Ecto.Changeset{}} = Recation.update_like(like, @invalid_attrs)
      assert like == Recation.get_like!(like.id)
    end
    @tag :skip
    test "delete_like/1 deletes the like" do
      like = like_fixture()
      assert {:ok, %Like{}} = Recation.delete_like(like)
      assert_raise Ecto.NoResultsError, fn -> Recation.get_like!(like.id) end
    end
    @tag :skip
    test "change_like/1 returns a like changeset" do
      like = like_fixture()
      assert %Ecto.Changeset{} = Recation.change_like(like)
    end
  end
end
