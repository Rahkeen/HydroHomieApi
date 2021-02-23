alias HydroHomie.Repo
alias HydroHomie.Water.Day

Repo.insert! %Day{
  date: Date.new(2021, 2, 22) |> elem(1),
  count: 2,
  goal: 8
}

Repo.insert! %Day{
  date: Date.new(2021, 2, 23) |> elem(1),
  count: 0,
  goal: 8
}

Repo.insert! %Day{
  date: Date.new(2021, 2, 24) |> elem(1),
  count: 0,
  goal: 8
}

Repo.insert! %Day{
  date: Date.new(2021, 2, 25) |> elem(1),
  count: 0,
  goal: 8
}
