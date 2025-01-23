#ゲームの中身
require_relative 'card' # card.rb を読み込む

class Game 
    def start
        puts "戦争を開始します。"
        #カードを均等に配る

        puts "カードが配られました。"

    end
    def shuffle
        
    end
    def battle
        puts "戦争！"
        puts "#{player1.Card}は#{player1.Deck}です。"
        puts "#{player2.Card}は#{player2.Deck}です。"
        if player1.Deck > player2.Deck#ここで条件分岐
            puts "プレイヤー1が勝ちました。"

        elsif player2.Deck > player1.Deck
            puts "プレイヤー2が勝ちました。"
        else 
            puts "引き分けです。"

        end

    end

    def owari
        puts "戦争を終了します。"
    end

end
