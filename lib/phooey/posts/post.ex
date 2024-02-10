defmodule Phooey.Posts.Post do
  @moduledoc """
  Schema for the `posts` table.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :title, :string
    field :body, :string
    belongs_to :user, Phooey.Accounts.User
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:body, :title, :user_id])
    |> validate_required([:body, :title, :user_id])
  end
end
