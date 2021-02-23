defmodule HydroHomie.Repo.Migrations.CreateDays do
  use Ecto.Migration

  def change do
    create table(:days) do
      add :date, :date
      add :count, :integer
      add :goal, :integer

      timestamps()
    end

  end
end
