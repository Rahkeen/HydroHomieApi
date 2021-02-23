defmodule HydroHomie.Water.Day do
  use Ecto.Schema
  import Ecto.Changeset

  schema "days" do
    field :count, :integer
    field :date, :date
    field :goal, :integer

    timestamps()
  end

  @doc false
  def changeset(day, attrs) do
    day
    |> cast(attrs, [:date, :count, :goal])
    |> validate_required([:date, :count, :goal])
  end
end
