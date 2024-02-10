defmodule PhooeyWeb.PageController do
  use PhooeyWeb, :controller

  alias Phooey.Accounts

  def home(conn, _params) do
    render(conn, :home)
  end

  def users(conn, _params) do
    render(conn, %{users: Accounts.list_users()})
  end
end
