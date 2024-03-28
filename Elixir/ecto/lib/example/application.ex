defmodule Example.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  alias Example.Repo

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Example.Worker.start_link(arg)
      # {Example.Worker, arg},
      Example.Repo
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Example.Supervisor]
    Supervisor.start_link(children, opts)

    main()

    {:ok, self()}
  end

  def main() do
    IO.write("Clean up database... ")
    Repo.get_all_departments() |> Repo.delete_many!()
    Repo.get_all_people() |> Repo.delete_many!()
    Repo.get_all_employees() |> Repo.delete_many!()
    IO.puts("done")
    IO.puts("")

    IO.write("Add departments... ")
    dep1 = Repo.add_department!("Department One")
    dep2 = Repo.add_department!("Department Two")
    IO.puts("done")
    IO.puts("")

    IO.puts("Added departments:")
    Enum.each(Repo.get_all_departments(), &IO.puts(&1))
    IO.puts("")

    IO.write("Add people... ")
    per1 = Repo.add_person!("Ivan", "Moscow", %Date{year: 1990, month: 10, day: 02})
    per2 = Repo.add_person!("John", "London", %Date{year: 1998, month: 01, day: 14})
    IO.puts("done")
    IO.puts("")

    IO.puts("Added people:")
    Enum.each(Repo.get_all_people(), &IO.puts(&1))
    IO.puts("")

    IO.write("Add employees... ")
    Repo.add_employee!(dep1, per1, :Staffer)
    Repo.add_employee!(dep1, per2, :Staffer)
    Repo.add_employee!(dep2, "Nick", "Berlin", %Date{year: 1995, month: 02, day: 23}, :Manager)
    Repo.add_employee!(dep2, "Stan", "Oslo", %Date{year: 1988, month: 04, day: 21}, :Boss)
    IO.puts("done")
    IO.puts("")

    IO.puts("Added employees:")
    Enum.each(Repo.get_all_employees(), &IO.puts(&1))
    IO.puts("")

    IO.write("Delete Department One... ")
    Repo.delete!(dep1)
    IO.puts("done")
    IO.puts("")

    IO.write("Update Department Two... ")
    dep2 = Repo.update_department!(dep2, %{name: "Department"})
    IO.puts("done")
    IO.puts("")

    IO.write("Update Ivan... ")
    Repo.update_person!(per1, %{address: "Tula"})
    IO.puts("done")
    IO.puts("")

    IO.puts("Remain departments:")
    Enum.each(Repo.get_all_departments(), &IO.puts(&1))
    IO.puts("")

    IO.puts("Remain people:")
    Enum.each(Repo.get_all_people(), &IO.puts(&1))
    IO.puts("")

    IO.puts("Remain employees:")
    Enum.each(Repo.get_all_employees(), &IO.puts(&1))
    IO.puts("")

    IO.write("Delete Department Two... ")
    Repo.delete!(dep2)
    IO.puts("done")
    IO.puts("")

    IO.write("Remain departments count: ")
    Repo.get_all_departments() |> Enum.count() |> IO.puts()
    IO.puts("")

    IO.puts("Remain people:")
    Enum.each(Repo.get_all_people(), &IO.puts(&1))
    IO.puts("")

    IO.write("Remain employees count: ")
    Repo.get_all_employees() |> Enum.count() |> IO.puts()
    IO.puts("")

    IO.write("Delete people... ")
    Repo.get_all_people() |> Repo.delete_many!()
    IO.puts("done")
    IO.puts("")

    IO.write("Remain people count: ")
    Repo.get_all_people() |> Enum.count() |> IO.puts()
    IO.puts("")
  end
end
