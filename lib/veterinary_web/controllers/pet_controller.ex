defmodule VeterinaryWeb.PetController do
  use VeterinaryWeb, :controller

  alias Veterinary.Pets
  alias Veterinary.Pets.Pet
  alias Veterinary.Owners
  alias Veterinary.Owners.Owner

  action_fallback VeterinaryWeb.FallbackController

  def index(conn, _params) do
    pets = Pets.list_pets()
    render(conn, :index, pets: pets)
  end

  def create(conn, %{"pet" => pet_params}) do
    with {:ok, %Pet{} = pet} <- Pets.create_pet(pet_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/pets/#{pet}")
      |> render(:show, pet: pet)
    end
  end

  def show(conn, %{"id" => id}) do
    pet = Pets.get_pet!(id)
    render(conn, :show, pet: pet)
  end

  def update(conn, %{"id" => id, "pet" => pet_params}) do
    pet = Pets.get_pet!(id)

    with {:ok, %Pet{} = pet} <- Pets.update_pet(pet, pet_params) do
      render(conn, :show, pet: pet)
    end
  end

  def delete(conn, %{"id" => id}) do
    pet = Pets.get_pet!(id)

    with {:ok, %Pet{}} <- Pets.delete_pet(pet) do
      send_resp(conn, :no_content, "")
    end
  end

  ### Functions

  def get_owner_pet(conn, %{"id" => id}) do
    owner = Pets.get_owner_pet!(id)
    render(conn, :get_owner_pet, owner: owner)
  end

  def get_pet_name(conn, %{"name" => name}) do
    pet = Pets.get_pet_name!(name)
    render(conn, :get_pet_name, pet: pet)
  end
end
