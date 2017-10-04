# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Microblog.Repo.insert!(%Microblog.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Microblog.Repo
alias Microblog.Blog.Message
alias Microblog.Accounts.User

Repo.delete_all(User)
Repo.delete_all(Message)

Repo.insert!(%User{email: "test@example.com", username: "test"})
Repo.insert!(%User{email: "user1@example.com", username: "user1"})
Repo.insert!(%User{email: "user2@example.com", username: "user2"})
Repo.insert!(%User{email: "anotherUser@example.com", username: "anotherUser"})
Repo.insert!(%User{email: "jeff@example.com", username: "jeff"})

Repo.insert(%Message{postingUser: "test", message: "What time is the #homework due?"})
Repo.insert(%Message{postingUser: "user1" ,message: "#homework is never due!! @test"})
Repo.insert(%Message{postingUser: "user2" ,message: "#nohomework @test @user1"})
Repo.insert(%Message{postingUser: "anotherUser" ,message: "I did the #homework"})
