defmodule Article do
  @derive [Poison.Encoder]
  defstruct [:author_name, :blog_id, :excerpt, :submitted, :title, :url]

  def all do
    HTTPoison.get!("https://learn.co/magazine/blog-posts?page=1&page_size=53").body 
    |> Poison.decode!(as: %{"blog_posts" => [%Article{}]}) 
    |> Map.get("blog_posts")
  end
end
