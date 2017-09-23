defmodule Mix.Tasks.LearnMagazine do
  use Mix.Task

  def run(_) do
    {:ok, _started} = Application.ensure_all_started(:httpoison)
    LearnMagazine.start
  end
end