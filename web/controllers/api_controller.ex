defmodule Hackathon.ApiController do
  use Hackathon.Web, :controller

  def place_order(conn, params) do
    params["part_number_key"] 
    |> EmagApi.get_details_for_product_pnk
    |> EmagApi.add_to_cart
    render conn, "index.json", success: EmagApi.purchase
  end

  def add_to_cart(conn, params) do
    result = params["part_number_key"] 
             |> EmagApi.get_details_for_product_pnk
             |> EmagApi.add_to_cart
    render conn, "index.json", success: result
  end

  def add_to_wishlist(conn, params) do
    result = params["part_number_key"] 
             |> EmagApi.add_to_wishlist
    render conn, "index.json", success: result
  end
end

