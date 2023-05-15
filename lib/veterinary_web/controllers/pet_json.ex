defmodule VeterinaryWeb.PetJSON do
  alias Veterinary.Pets.Pet
  alias Veterinary.Owners.Owner

  @doc """
  Renders a list of pets.
  """
  def index(%{pets: pets}) do
    %{data: for(pet <- pets, do: data(pet))}
  end

  @doc """
  Renders a single pet.
  """
  def show(%{pet: pet}) do
    %{data: data(pet)}
  end

  defp data(%Pet{} = pet) do
    %{
      id: pet.id,
      name: pet.name,
      kind: pet.kind,
      breed: pet.breed,
      color: pet.color,
      gender: pet.gender,
      birthdate: pet.birthdate,
      size: pet.size,
      weight: pet.weight,
      additionalCharacteristics: pet.additionalCharacteristics,
      chip: pet.chip
    }
  end

  ### functions

  defp data_owner(%Owner{} = owner) do
    %{
      id: owner.id,
      document_id: owner.document_id,
      name: owner.name,
      lastname: owner.lastname,
      birthdate: owner.birthdate,
      gender: owner.gender,
      email: owner.email,
      address: owner.address,
      cellphone: owner.cellphone,
      phone: owner.phone,
      city: owner.city
    }
  end

  def get_owner_pet(%{owner: owner}) do
    %{data_owner: data_owner(owner)}
  end

  def get_pet_name(%{pet: pet}) do
    %{data: data(pet)}
  end
end
