defmodule Theresumemanager.Repo do
  use Ecto.Repo,
    otp_app: :theresumemanager,
    adapter: Ecto.Adapters.Postgres
end
