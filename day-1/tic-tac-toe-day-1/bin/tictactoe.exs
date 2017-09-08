require IEx;

defmodule TicTacToe do
  def call do
    IO.puts "Welcome to Tic Tac Toe!!!"
    IO.puts "\n"
    board = ["X", " ", " ", " ", " ", " ", " ", " ", " "]

    TicTacToe.display_board(board)
    board = move(board)

    display_board(board)
  end

  def move(board) do
    index = ask_for_move()

    case valid_move?(board, index) do
      true -> List.insert_at(board, index, "X")
      false -> move(board)
    end
  end

  def valid_move?(board, index) do
    Enum.at(board, index) == " "
  end

  def ask_for_move do
    IO.gets("Where would you like to go? 1-9\n") |> 
              process_move_input
  end

  def convert_input_to_index(integer_input) do
    integer_input - 1
  end

  def convert_user_input(string_input) do
    string_input |> String.trim |> Integer.parse
  end

  def process_move_input(string_input) do
    case convert_user_input(string_input) do
      {value, _} -> convert_input_to_index(value)
      :error -> 
        IO.puts "Please enter a valid integer, 1-9\n"
        ask_for_move()
    end
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
