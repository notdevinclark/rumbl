defmodule Rumbl.TestHelpers do
  alias Rumbl.Repo
  alias Rumbl.User

  def insert_user, do: insert_user(%{})
  def insert_user(attrs) do
    changes = Dict.merge(%{
      name: "Some User",
      username: "user#{Base.encode16(:crypto.rand_bytes(8))}",
      password: "supersecret"
    }, attrs)

    %User{}
    |> User.registration_changeset(changes)
    |> Repo.insert!
  end

  def insert_video(user), do: insert_video(user, %{})
  def insert_video(user, attrs) do
    user
    |> Ecto.Model.build(:videos, attrs)
    |> Repo.insert!
  end
end
