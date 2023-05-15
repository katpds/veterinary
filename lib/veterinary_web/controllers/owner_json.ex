defmodule VeterinaryWeb.OwnerJSON do
  alias Veterinary.Owners.Owner
  alias Veterinary.Pets.Pet

  @doc """
  Renders a list of owners.
  """
  def index(%{owners: owners}) do
    %{data: for(owner <- owners, do: data(owner))}
  end

  @doc """
  Renders a single owner.
  """
  def show(%{owner: owner}) do
    %{data: data(owner)}
  end

  defp data(%Owner{} = owner) do
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



  ###functions

  def show_document(%{owner: owner}) do
    %{data: data(owner)}
  end

  #def show_pets_owner(%{owner: owner}) do
  #  %{data: data(owner)}
  #end

  defp data_pets(%Pet{} = pet) do
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

  def get_pets_owner(%{pets: pets}) do
    %{data_pets: for(pet <- pets, do: data_pets(pet))}
  end
end
