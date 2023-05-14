defmodule Veterinary.PetsTest do
  use Veterinary.DataCase

  alias Veterinary.Pets

  describe "pets" do
    alias Veterinary.Pets.Pet

    import Veterinary.PetsFixtures

    @invalid_attrs %{additionalCharacteristics: nil, birthdate: nil, breed: nil, chip: nil, color: nil, gender: nil, kind: nil, name: nil, size: nil, weight: nil}

    test "list_pets/0 returns all pets" do
      pet = pet_fixture()
      assert Pets.list_pets() == [pet]
    end

    test "get_pet!/1 returns the pet with given id" do
      pet = pet_fixture()
      assert Pets.get_pet!(pet.id) == pet
    end

    test "create_pet/1 with valid data creates a pet" do
      valid_attrs = %{additionalCharacteristics: "some additionalCharacteristics", birthdate: "some birthdate", breed: "some breed", chip: true, color: "some color", gender: "some gender", kind: "some kind", name: "some name", size: "some size", weight: 42}

      assert {:ok, %Pet{} = pet} = Pets.create_pet(valid_attrs)
      assert pet.additionalCharacteristics == "some additionalCharacteristics"
      assert pet.birthdate == "some birthdate"
      assert pet.breed == "some breed"
      assert pet.chip == true
      assert pet.color == "some color"
      assert pet.gender == "some gender"
      assert pet.kind == "some kind"
      assert pet.name == "some name"
      assert pet.size == "some size"
      assert pet.weight == 42
    end

    test "create_pet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pets.create_pet(@invalid_attrs)
    end

    test "update_pet/2 with valid data updates the pet" do
      pet = pet_fixture()
      update_attrs = %{additionalCharacteristics: "some updated additionalCharacteristics", birthdate: "some updated birthdate", breed: "some updated breed", chip: false, color: "some updated color", gender: "some updated gender", kind: "some updated kind", name: "some updated name", size: "some updated size", weight: 43}

      assert {:ok, %Pet{} = pet} = Pets.update_pet(pet, update_attrs)
      assert pet.additionalCharacteristics == "some updated additionalCharacteristics"
      assert pet.birthdate == "some updated birthdate"
      assert pet.breed == "some updated breed"
      assert pet.chip == false
      assert pet.color == "some updated color"
      assert pet.gender == "some updated gender"
      assert pet.kind == "some updated kind"
      assert pet.name == "some updated name"
      assert pet.size == "some updated size"
      assert pet.weight == 43
    end

    test "update_pet/2 with invalid data returns error changeset" do
      pet = pet_fixture()
      assert {:error, %Ecto.Changeset{}} = Pets.update_pet(pet, @invalid_attrs)
      assert pet == Pets.get_pet!(pet.id)
    end

    test "delete_pet/1 deletes the pet" do
      pet = pet_fixture()
      assert {:ok, %Pet{}} = Pets.delete_pet(pet)
      assert_raise Ecto.NoResultsError, fn -> Pets.get_pet!(pet.id) end
    end

    test "change_pet/1 returns a pet changeset" do
      pet = pet_fixture()
      assert %Ecto.Changeset{} = Pets.change_pet(pet)
    end
  end
end
