defmodule Veterinary.Pets.Pet do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "pets" do
    field :additionalCharacteristics, :string
    field :birthdate, :string
    field :breed, :string
    field :chip, :string
    field :color, :string
    field :gender, :string
    field :kind, :string
    field :name, :string
    field :size, :string
    field :weight, :integer
    #field :owner_id, :binary_id
    #field :id, :integer, primary_key: true

    belongs_to :owner, Veterinary.Owners.Owner
    timestamps()
  end

  @doc false
  def changeset(pet, attrs) do
    pet
    |> cast(attrs, [:name, :kind, :breed, :color, :gender, :birthdate, :size, :weight, :additionalCharacteristics, :chip, :owner_id])
    |> validate_required([:name, :kind, :breed, :color, :gender, :birthdate, :size, :weight, :additionalCharacteristics, :chip, :owner_id])
  end
end
