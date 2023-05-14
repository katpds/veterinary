defmodule Veterinary.PetsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Veterinary.Pets` context.
  """

  @doc """
  Generate a pet.
  """
  def pet_fixture(attrs \\ %{}) do
    {:ok, pet} =
      attrs
      |> Enum.into(%{
        additionalCharacteristics: "some additionalCharacteristics",
        birthdate: "some birthdate",
        breed: "some breed",
        chip: true,
        color: "some color",
        gender: "some gender",
        kind: "some kind",
        name: "some name",
        size: "some size",
        weight: 42
      })
      |> Veterinary.Pets.create_pet()

    pet
  end
end
