defmodule Hackathon.IftttApiController do
  use Hackathon.Web, :controller

  def added_to_wishlist(conn, params) do
    render conn, "index.json", success: IftttApi.added_to_wishlist(params)
  end

  def placed_order(conn, params) do
    render conn, "index.json", success: IftttApi.placed_order(params)
  end

  def added_to_cart(conn, params) do
    render conn, "index.json", success: IftttApi.added_to_cart(params)
  end
end


