defmodule Veterinary.Repo.Migrations.CreatePets do
  use Ecto.Migration

  def change do
    create table(:pets, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :kind, :string
      add :breed, :string
      add :color, :string
      add :gender, :string
      add :birthdate, :string
      add :size, :string
      add :weight, :integer
      add :additionalCharacteristics, :string
      add :chip, :string
      add :owner_id, references(:owners, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:pets, [:owner_id])
  end
end
