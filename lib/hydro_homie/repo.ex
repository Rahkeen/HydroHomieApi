defmodule HydroHomie.Repo do
  use Ecto.Repo,
    otp_app: :hydro_homie,
    adapter: Ecto.Adapters.Postgres
end
