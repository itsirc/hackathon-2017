defmodule EmagApi do
  @api_prefix "https://m-api.emag.ro/v1.0"

  @moduledoc """
  Documentation for Hackathon.
  """
  @doc """
  """
  def add_to_cart(offer_id) do
    HTTPoison.start
    body = [{"product_id", offer_id}]
    headers = RequestUtils.get_generic_headers
    {:ok, response} = HTTPoison.post "#{@api_prefix}/cart/product", URL.to_query(body), headers
    response.status_code < 400
  end

  def add_to_wishlist(pnk) do
    HTTPoison.start
    body = []
    headers = RequestUtils.get_generic_headers
    {:ok, response} = HTTPoison.post "#{@api_prefix}/wishlist/#{pnk}", URL.to_query(body), headers
    response.status_code < 400
  end

  def get_details_for_product_pnk(pnk) do
    HTTPoison.start
    headers = RequestUtils.get_generic_headers
    response = HTTPoison.get! "#{@api_prefix}/product/#{pnk}", headers
    process_response_body(response.body)["data"]["id"]
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
  end

  def purchase do
    HTTPoison.start
    body = [{"payment_method", "numerar"},
    {"user_name", "ifttt test"},
    {"user_phone", "1111111111"},
    {"delivery_user_adress_id", "9044012"},
    {"invoice_type", "pf"}]
    headers = RequestUtils.get_generic_headers
    {:ok, response} = HTTPoison.post "#{@api_prefix}/cart/process", URL.to_query(body), headers
    response.status_code < 400
  end
end
