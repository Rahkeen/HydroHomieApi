defmodule HydroHomie.WaterTest do
  use HydroHomie.DataCase

  alias HydroHomie.Water

  describe "days" do
    alias HydroHomie.Water.Day

    @valid_attrs %{count: 42, date: ~D[2010-04-17], goal: 42}
    @update_attrs %{count: 43, date: ~D[2011-05-18], goal: 43}
    @invalid_attrs %{count: nil, date: nil, goal: nil}

    def day_fixture(attrs \\ %{}) do
      {:ok, day} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Water.create_day()

      day
    end

    test "list_days/0 returns all days" do
      day = day_fixture()
      assert Water.list_days() == [day]
    end

    test "get_day!/1 returns the day with given id" do
      day = day_fixture()
      assert Water.get_day!(day.id) == day
    end

    test "create_day/1 with valid data creates a day" do
      assert {:ok, %Day{} = day} = Water.create_day(@valid_attrs)
      assert day.count == 42
      assert day.date == ~D[2010-04-17]
      assert day.goal == 42
    end

    test "create_day/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Water.create_day(@invalid_attrs)
    end

    test "update_day/2 with valid data updates the day" do
      day = day_fixture()
      assert {:ok, %Day{} = day} = Water.update_day(day, @update_attrs)
      assert day.count == 43
      assert day.date == ~D[2011-05-18]
      assert day.goal == 43
    end

    test "update_day/2 with invalid data returns error changeset" do
      day = day_fixture()
      assert {:error, %Ecto.Changeset{}} = Water.update_day(day, @invalid_attrs)
      assert day == Water.get_day!(day.id)
    end

    test "delete_day/1 deletes the day" do
      day = day_fixture()
      assert {:ok, %Day{}} = Water.delete_day(day)
      assert_raise Ecto.NoResultsError, fn -> Water.get_day!(day.id) end
    end

    test "change_day/1 returns a day changeset" do
      day = day_fixture()
      assert %Ecto.Changeset{} = Water.change_day(day)
    end
  end
end
