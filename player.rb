require_relative 'card' # card.rb を読み込む

class Player
    attr_accessor :name, :deck, :stacks
    def initialize(name)
        @name = name
        @deck = deck #デッキ=最初に配られた時の山札
        @stacks = [] #手札=スタック　→前の対戦までにめくられたカードたち、デッキが0になったら手札がデッキに戻される
    end
end