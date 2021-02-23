defmodule HydroHomieWeb.DayControllerTest do
  use HydroHomieWeb.ConnCase

  alias HydroHomie.Water
  alias HydroHomie.Water.Day

  @create_attrs %{
    count: 42,
    date: ~D[2010-04-17],
    goal: 42
  }
  @update_attrs %{
    count: 43,
    date: ~D[2011-05-18],
    goal: 43
  }
  @invalid_attrs %{count: nil, date: nil, goal: nil}

  def fixture(:day) do
    {:ok, day} = Water.create_day(@create_attrs)
    day
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all days", %{conn: conn} do
      conn = get(conn, Routes.day_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create day" do
    test "renders day when data is valid", %{conn: conn} do
      conn = post(conn, Routes.day_path(conn, :create), day: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.day_path(conn, :show, id))

      assert %{
               "id" => id,
               "count" => 42,
               "date" => "2010-04-17",
               "goal" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.day_path(conn, :create), day: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update day" do
    setup [:create_day]

    test "renders day when data is valid", %{conn: conn, day: %Day{id: id} = day} do
      conn = put(conn, Routes.day_path(conn, :update, day), day: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.day_path(conn, :show, id))

      assert %{
               "id" => id,
               "count" => 43,
               "date" => "2011-05-18",
               "goal" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, day: day} do
      conn = put(conn, Routes.day_path(conn, :update, day), day: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete day" do
    setup [:create_day]

    test "deletes chosen day", %{conn: conn, day: day} do
      conn = delete(conn, Routes.day_path(conn, :delete, day))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.day_path(conn, :show, day))
      end
    end
  end

  defp create_day(_) do
    day = fixture(:day)
    %{day: day}
  end
end
