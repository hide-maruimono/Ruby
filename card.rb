class Card
    attr_reader :suit, :number, :cards, :value
    def initialize
        @suit = ["スペード", "ハート", "ダイヤ", "クラブ"]
        @number = (2..10).to_a + ['J', 'Q', 'K', 'A']#2からAまでを配列にする
        @cards = @suit.product(@number).map{|suit, number| "#{suit}の#{number}"} #上の2つの配列を組み合わせてトランプにする
        @value = { "2" => 1, "3" => 2, "4" => 3, "5" => 4, "6" => 5, "7" => 6, "8" => 7, "9" => 8, "10" => 9, "J" => 10, "Q" => 11, "K" => 12, "A" => 13 } #強さ
    end
end
card = Card.new
puts card.cards

#     def value
#         @value = { "2" => 1, "3" => 2, "4" => 3, "5" => 4, "6" => 5, "7" => 6, "8" => 7, "9" => 8, "10" => 9, "J" => 10, "Q" => 11, "K" => 12, "A" => 13 }
    
#     end

# end