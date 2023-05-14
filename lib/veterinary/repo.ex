defmodule Veterinary.Repo do
  use Ecto.Repo,
    otp_app: :veterinary,
    adapter: Ecto.Adapters.Postgres
end
