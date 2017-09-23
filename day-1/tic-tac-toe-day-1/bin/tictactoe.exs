require IEx;
require Integer;

defmodule TicTacToe do
  def call do
    IO.puts "Welcome to Tic Tac Toe!!!"
    board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    
    TicTacToe.display_board(board)

    board |> play
  end

  def play(board) do
    case over?(board) do
      false -> board |> turn |> play
      true -> IO.puts "Cat's Game!!!"
      winner -> IO.puts "#{winner} has won!!!"       
    end
  end

  def turn(board) do
    board |> move |> display_board
  end

  def over?(board) do
    won?(board) || full?(board)
  end

  def won?(board) do
    winning_combinations = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
    ]

    won_combo = Enum.find(winning_combinations, fn(winning_combo) -> 
      Enum.at(board, Enum.at(winning_combo, 0)) != " " &&
      Enum.at(board, Enum.at(winning_combo, 0)) == Enum.at(board, Enum.at(winning_combo, 1)) &&
      Enum.at(board, Enum.at(winning_combo, 1)) == Enum.at(board, Enum.at(winning_combo, 2))
    end)

    if won_combo do
      Enum.at(board, Enum.at(won_combo, 0))
    end
  end

  def full?(board) do
    Enum.all?(board, fn(token) -> token == "X" || token == "O"  end)
  end

  def move(board) do
    index = ask_for_move()

    case valid_move?(board, index) do
      true -> List.replace_at(board, index, current_player(board))
      false -> move(board)
    end
  end

  def current_player(board) do
    if board |> turn_count |> Integer.is_odd, do: "O", else: "X"
    # if turn_count(board) |> Integer.is_odd, do: "O", else: "X"
    # board.turn_count.odd? ? "O"  : "X"
  end

  def turn_count(board) do
    Enum.count(board, fn(token) -> token == "X" || token == "O"  end)
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
    IO.puts "\n"

    IO.puts " #{Enum.at(board, 0)} | #{Enum.at(board, 1)} | #{Enum.at(board, 2)} "
    IO.puts "-----------"
    IO.puts " #{Enum.at(board, 3)} | #{Enum.at(board, 4)} | #{Enum.at(board, 5)} "
    IO.puts "-----------"
    IO.puts " #{Enum.at(board, 6)} | #{Enum.at(board, 7)} | #{Enum.at(board, 8)} "

    IO.puts "\n"

    board
  end
end

TicTacToe.call
