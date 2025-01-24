require_relative 'card' # card.rb を読み込む

class Deck  #デッキクラス
    attr_reader :deck
    def initialize
        @deck = Card.new.cards #ここでcardから配列を持ってくる
    end

    def shuffle_deck  #デッキをシャッフルするメソッド
        @deck.shuffle
    end
end