defmodule HydroHomieWeb.DayView do
  use HydroHomieWeb, :view
  alias HydroHomieWeb.DayView

  def render("index.json", %{days: days}) do
    %{data: render_many(days, DayView, "day.json")}
  end

  def render("show.json", %{day: day}) do
    %{data: render_one(day, DayView, "day.json")}
  end

  def render("day.json", %{day: day}) do
    %{id: day.id,
      date: day.date,
      count: day.count,
      goal: day.goal}
  end
end
