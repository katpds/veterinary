defmodule Veterinary.Repo.Migrations.CreateOwners do
  use Ecto.Migration

  def change do
    create table(:owners, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :document_id, :integer
      add :name, :string
      add :lastname, :string
      add :birthdate, :string
      add :gender, :string
      add :email, :string
      add :address, :string
      add :cellphone, :integer
      add :phone, :integer
      add :city, :string

      timestamps()
    end
    create unique_index(:owners, [:document_id])
  end
end
