defmodule HydroHomieWeb.DayController do
  use HydroHomieWeb, :controller

  alias HydroHomie.Water
  alias HydroHomie.Water.Day

  action_fallback HydroHomieWeb.FallbackController

  def index(conn, _params) do
    days = Water.list_days()
    render(conn, "index.json", days: days)
  end

  def create(conn, %{"day" => day_params}) do
    with {:ok, %Day{} = day} <- Water.create_day(day_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.day_path(conn, :show, day))
      |> render("show.json", day: day)
    end
  end

  def show(conn, %{"id" => id}) do
    day = Water.get_day!(id)
    render(conn, "show.json", day: day)
  end

  def update(conn, %{"id" => id, "day" => day_params}) do
    day = Water.get_day!(id)

    with {:ok, %Day{} = day} <- Water.update_day(day, day_params) do
      render(conn, "show.json", day: day)
    end
  end

  def delete(conn, %{"id" => id}) do
    day = Water.get_day!(id)

    with {:ok, %Day{}} <- Water.delete_day(day) do
      send_resp(conn, :no_content, "")
    end
  end
end
