defmodule VeterinaryWeb.PetJSON do
  alias Veterinary.Pets.Pet

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
end
