defmodule LearnMagazineTest do
  use ExUnit.Case
  doctest LearnMagazine

  test "greets the world" do
    assert LearnMagazine.hello() == :world
  end
end
