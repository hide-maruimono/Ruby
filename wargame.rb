#ゲームの中身
require_relative 'card' # card.rb を読み込む
require_relative 'deck' # deck.rb を読み込む

class Game 
    def initialize
        @deck = Deck.new
    end

    def wargame
        puts "戦争を開始します。"
        cards = @deck.shuffle_deck #デッキをシャッフル
        player1_deck, player2_deck = cards.each_slice(52 / 2).to_a#カードを均等に配る
        puts "カードが配られました。"
        # print "Player 1's deck: #{player1_deck.inspect}"
        puts "戦争！"

        player1_card = player1_deck.shift
        player2_card = player2_deck.shift

        puts "プレイヤー1のカードは#{player1_card}です。"
        puts "プレイヤー2のカードは#{player2_card}です。"

        if player1_card > player2_card#ここで条件分岐
            puts "プレイヤー1が勝ちました。"
            puts "戦争を終了します。"
        elsif player2_card > player1_card
            puts "プレイヤー2が勝ちました。"
            puts "戦争を終了します。"
        else 
            puts "引き分けです。"

        end

    end

    # def end_game
    #     puts "戦争を終了します。"
    # end
    

end
game = Game.new
game.wargame