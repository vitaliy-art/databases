defmodule Models.Employee do
  alias Models.Person
  alias Models.Department
  use Ecto.Schema

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "employees" do
    belongs_to(:department, Department)
    @foreign_key_type Ecto.UUID
    belongs_to(:person, Person)
    field(:position, Ecto.Enum, values: [:Staffer, :Manager, :Boss])
  end

  def changeset(employee, params \\ %{}) do
    employee
    |> Ecto.Changeset.cast(params, [:position])
    |> Ecto.Changeset.validate_required([:position, :department, :person])
  end
end

defimpl String.Chars, for: Models.Employee do
  def to_string(emp) do
    "Employee {Id: #{emp.id}, Person: #{emp.person}, Department: #{emp.department}, Position: #{emp.position} }"
  end
end
