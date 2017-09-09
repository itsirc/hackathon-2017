defmodule IftttApi do
  @event_added_to_cart "added_to_cart"
  @event_added_to_wishlist "added_to_wishlist"
  @event_placed_order "placed_order"

  @moduledoc """
  Documentation for Hackathon.
  """
  @doc """
    Make a request to the IFTTT Maker API, with a list of parameters
  """
  def make_ifttt_request(event, values) do
    HTTPoison.start
    url = "https://maker.ifttt.com/trigger/#{event}/with/key/#{RequestUtils.get_ifttt_maker_api_key}"
    params = values 
             |> Enum.with_index(1) 
             |> Enum.map(fn {v,k} -> {"value#{k}",v} end) 
             |> Map.new
    {:ok, response} = HTTPoison.post url, Poison.encode!(params), [{"Content-Type", "application/json"}]
    response.status_code < 400
  end

  @doc """
    Extract the relevant product information from an eMAG product dictionary
  """
  def product_relevant_values(dictionary) do
    [dictionary["name"], dictionary["price"]["current"], dictionary["url"]]
  end

  @doc """
    Trigger event for product added to cart
  """
  def added_to_cart(dictionary) do
    make_ifttt_request(@event_added_to_cart, product_relevant_values(dictionary))
  end

  @doc """
    Trigger event for product added to wishlist 
  """
  def added_to_wishlist(dictionary) do
    make_ifttt_request(@event_added_to_wishlist, product_relevant_values(dictionary))
  end

  @doc """
    Trigger event for product placed
  """
  def placed_order(dictionary) do
    make_ifttt_request(@event_placed_order, [dictionary["total"]])
  end
end
