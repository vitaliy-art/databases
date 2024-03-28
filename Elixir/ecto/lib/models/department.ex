defmodule Models.Department do
  use Ecto.Schema

  schema "departments" do
    field(:name, :string)
  end

  def changeset(department, params \\ %{}) do
    department
    |> Ecto.Changeset.cast(params, [:name])
    |> Ecto.Changeset.validate_required([:name])
  end
end

defimpl String.Chars, for: Models.Department do
  def to_string(dep) do
    "Department { Id: #{dep.id}, Name: #{dep.name} }"
  end
end
