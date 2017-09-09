defmodule Hackathon.Router do
  use Hackathon.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Hackathon do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", Hackathon do
    pipe_through :api
    post "/wishlist/add", ApiController, :add_to_wishlist
    post "/order/place", ApiController, :place_order
    post "/cart/add", ApiController, :add_to_cart

    post "/wishlist/added", IftttApiController, :added_to_wishlist
    post "/order/placed", IftttApiController, :placed_order
    post "/cart/added", IftttApiController, :added_to_cart
  end
end
