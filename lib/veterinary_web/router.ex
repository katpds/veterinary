defmodule VeterinaryWeb.Router do
  use VeterinaryWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", VeterinaryWeb do
    pipe_through :api

    resources "/owners", OwnerController, except: [:new, :edit]
    resources "/pets", PetController, except: [:new, :edit]

    ### functions

    get "/owner/document_id/:document_id", OwnerController, :show_document
    get "/owner/pets_owner/:id", OwnerController, :get_pets_owner


    get "/pet/owner_pet/:id", PetController, :get_owner_pet
    get "/pet/name_pet/:name", PetController, :get_pet_name
  end
end
