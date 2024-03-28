defmodule Example.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees, primary_key: false) do
      add :id, :uuid, primary_key: true, null: false
      add :department_id, references(:departments, on_delete: :delete_all)
      add :person_id, references(:people, type: :uuid, on_delete: :delete_all)
      add :position, :string
    end
  end
end
