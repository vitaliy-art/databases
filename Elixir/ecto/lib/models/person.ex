defmodule Models.Person do
  use Ecto.Schema

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "people" do
    field :name, :string
    field :birth_date, :date
    field :address, :string
  end

  def changeset(person, params \\ %{}) do
    person
    |> Ecto.Changeset.cast(params, [:name, :birth_date, :address])
    |> Ecto.Changeset.validate_required([:name, :birth_date, :address])
  end
end

defimpl String.Chars, for: Models.Person do
  def to_string(per) do
    "Person { Id: #{per.id}, Name: #{per.name}, Address: #{per.address}, BirthDate: #{per.birth_date} }"
  end
end
