require IEx;

defmodule LearnMagazine do
  def start do
    IO.puts "Welcome to the Learn Magazine."
    
    articles = Article.all
    # IO.gets("Hello from here\n")
    # ArticlePresenter.index(articles)

    # # Input Parser
    # article_to_read = IO.gets("Which article would you like to read?\n")
    # article_index = (article_to_read |> String.trim |> Integer.parse |> elem(0)) - 1

    # # # ArticleOpener
    # System.cmd("open", [Enum.at(articles, article_index).url])

    # 1. We need a loop for reading more articles
    # 2. Do we want an excerpt before opening in the browser?
    # 3. Can we move some functionality to some other object?
    # 4. Clean Up Parsing - also some other object...
    # 5. Properly running the application vs iex -S mix and then LearnMagazine.start 
    #   while still being able to IEx.pry for debugging.
    # 6. Memoization in Elixir?
  end

  def main(_) do
    LearnMagazine.start
  end
end
