defmodule Example.Repo.Migrations.CreatePeople do
  use Ecto.Migration

  def change do
    create table(:people, primary_key: false) do
      add :id, :uuid, primary_key: true, null: false
      add :name, :string
      add :birth_date, :date
      add :address, :string
    end
  end
end
