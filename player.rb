require_relative 'card' # card.rb を読み込む

class Player
    attr_accessor :name, :deck, :stacks
    def initialize(name)
        @name = name
        @deck = deck #デッキ=最初に配られた時の山札
        @stacks = [] #手札=スタック　→前の対戦までにめくられたカードたち、デッキが0になったら手札がデッキに戻される
    end
end



#場札=めくったカード　→この後勝者の手札になる
# class Player1 < Player #Playerクラスを継承
#     def initialize(name)
#         super(name)
#     end
# end

# class Player2 < Player #Playerクラスを継承
#     def initialize(name)
#         super(name)
#     end
# end

# puts "プレイヤー1の名前を入力してください:"
# name = gets.chomp