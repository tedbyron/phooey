defmodule Phooey.Repo do
  use Ecto.Repo,
    otp_app: :phooey,
    adapter: Ecto.Adapters.Postgres
end
