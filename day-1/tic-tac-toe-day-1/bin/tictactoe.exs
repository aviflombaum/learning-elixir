require IEx;

defmodule TicTacToe do
  def call do
    IO.puts "Welcome to Tic Tac Toe!!!"
    IO.puts "\n"
    board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

    TicTacToe.display_board(board)


    # How do I gets? gets is a way to get string input from the command line
    # How do I convert the String into an Integer to update that index in the board 
    # (after subtracting 1)

    # "Where would you like to go? 1 - 9"
    # 5
    #    |   |  
    # -----------
    #    | X |   
    # -----------
    #    |   |  

    input = IO.gets("Where would you like to go? 1-9\n")
    # what is the binding.pry of elixir?

    IEx.pry
  end

  def display_board(board) do # display_board/1
    IO.puts " #{Enum.at(board, 0)} | #{Enum.at(board, 1)} | #{Enum.at(board, 2)} "
    IO.puts "-----------"
    IO.puts " #{Enum.at(board, 3)} | #{Enum.at(board, 4)} | #{Enum.at(board, 5)} "
    IO.puts "-----------"
    IO.puts " #{Enum.at(board, 6)} | #{Enum.at(board, 7)} | #{Enum.at(board, 8)} "
  end
end

TicTacToe.call
