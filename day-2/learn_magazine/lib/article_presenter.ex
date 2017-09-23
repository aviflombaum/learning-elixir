defmodule ArticlePresenter do
  def index(articles) do
    articles
      |> Enum.with_index
      |> Enum.each(
          fn({article, i}) ->
            print_title(article, i)
          end
        )
  end

  defp print_title(%Article{title: title}, i) do
    IO.puts "#{i+1}. #{String.trim(title)}"
  end

end