require_relative 'card' # card.rb を読み込む

class Player
    def initialize(name)
        @name = name
end

class Player1 < Player
    @player1_deck = #プレイヤー1のデッキ
    @player2_Stacks = #プレイヤー1の場札

end

class Player2 < Player
    @player2_deck = #プレイヤー2のデッキ
    @player2_Stacks = #プレイヤー2の場札

end

# puts "プレイヤー1の名前を入力してください:"
# name = gets.chomp