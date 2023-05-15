defmodule VeterinaryWeb.OwnerController do
  use VeterinaryWeb, :controller

  alias Veterinary.Owners
  alias Veterinary.Owners.Owner
  alias Veterinary.Pets
  alias Veterinary.Pets.Pet


  action_fallback VeterinaryWeb.FallbackController

  def index(conn, _params) do
    owners = Owners.list_owners()
    render(conn, :index, owners: owners)
  end

  def create(conn, %{"owner" => owner_params}) do
    with {:ok, %Owner{} = owner} <- Owners.create_owner(owner_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/owners/#{owner}")
      |> render(:show, owner: owner)
    end
  end

  def show(conn, %{"id" => id}) do
    owner = Owners.get_owner!(id)
    render(conn, :show, owner: owner)
  end

  def update(conn, %{"id" => id, "owner" => owner_params}) do
    owner = Owners.get_owner!(id)

    with {:ok, %Owner{} = owner} <- Owners.update_owner(owner, owner_params) do
      render(conn, :show, owner: owner)
    end
  end

  def delete(conn, %{"id" => id}) do
    owner = Owners.get_owner!(id)

    with {:ok, %Owner{}} <- Owners.delete_owner(owner) do
      send_resp(conn, :no_content, "")
    end
  end

  ### functions

  def show_document(conn, %{"document_id" => document_id}) do
    owner = Owners.get_owner_document!(String.to_integer(document_id))
    render(conn, :show_document, owner: owner)
  end

  def get_pets_owner(conn, %{"id" => id}) do
    pets = Owners.get_pets_owner!(id)
    render(conn, :get_pets_owner, pets: pets)
  end

end
