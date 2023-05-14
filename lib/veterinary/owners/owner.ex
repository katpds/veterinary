defmodule Veterinary.Owners.Owner do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "owners" do
    field :address, :string
    field :birthdate, :string
    field :cellphone, :integer
    field :city, :string
    field :document_id, :integer
    field :email, :string
    field :gender, :string
    field :lastname, :string
    field :name, :string
    field :phone, :integer
    #field :id, :integer, primary_key: true
    has_many :pets, Veterinary.Pets.Pet
    timestamps()


  end

  @doc false
  def changeset(owner, attrs) do
    owner
    |> cast(attrs, [:document_id, :name, :lastname, :birthdate, :gender, :email, :address, :cellphone, :phone, :city])
    |> validate_required([:document_id, :name, :lastname, :birthdate, :gender, :email, :address, :cellphone, :phone, :city])
    |> unique_constraint(:document_id, message: "owner already exists")
  end
end
