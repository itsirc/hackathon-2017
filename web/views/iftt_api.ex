defmodule Hackathon.IftttApiView do
  use Hackathon.Web, :view
  def render("index.json", %{success: success}) do
    %{success: success}
  end
end


