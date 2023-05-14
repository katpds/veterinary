defmodule VeterinaryWeb.OwnerJSON do
  alias Veterinary.Owners.Owner

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
end
