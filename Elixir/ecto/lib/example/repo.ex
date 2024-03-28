defmodule Example.Repo do
  import Ecto.Query, only: [from: 2]
  alias Models.Employee
  alias Models.Person
  alias Models.Department

  use Ecto.Repo,
    otp_app: :example,
    adapter: Ecto.Adapters.SQLite3

  @spec add_department!(String.t()) :: Department
  def add_department!(name) do
    %Department{}
    |> Department.changeset(%{name: name})
    |> insert!()
  end

  @spec add_person!(String.t(), String.t(), Date) :: Person
  def add_person!(name, address, birth_date) do
    %Person{}
    |> Person.changeset(%{name: name, address: address, birth_date: birth_date})
    |> insert!()
  end

  @spec add_employee!(Department, Person, :Staffer | :Manager | :Boss) :: Employee
  def add_employee!(department, person, position) do
    %Employee{department: department, person: person}
    |> Employee.changeset(%{position: position})
    |> insert!()
  end

  @spec add_employee!(Department, String.t(), String.t(), Date, :Staffer | :Manager | :Boss) ::
          Employee
  def add_employee!(department, name, address, birth_date, position) do
    per = add_person!(name, address, birth_date)
    add_employee!(department, per, position)
  end

  @spec get_all_departments() :: list(Department)
  def get_all_departments(), do: Department |> all()

  @spec get_all_people() :: list(Person)
  def get_all_people(), do: Person |> all()

  def get_all_employees() do
    query = from(e in Employee, preload: [:department, :person])
    all(query)
  end

  @spec update_department!(Department, map()) :: Department
  def update_department!(department, updates) do
    department
    |> Department.changeset(updates)
    |> update!()
  end

  @spec update_person!(Person, map()) :: Person
  def update_person!(person, updates) do
    person
    |> Person.changeset(updates)
    |> update!()
  end

  @spec update_employee!(Employee, map()) :: Employee
  def update_employee!(employee, updates) do
    employee
    |> Employee.changeset(updates)
    |> update!()
  end

  def delete_many!(models) when is_list(models) do
    Enum.each(models, &delete(&1))
  end
end
