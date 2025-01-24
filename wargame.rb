#ゲームの中身
require_relative 'card' # card.rb を読み込む
require_relative 'deck' # deck.rb を読み込む
require_relative 'player' # player.rb を読み込む

class Game 
    def initialize
        @deck = Deck.new
    end

    def wargame
        puts "戦争を開始します。"
                
        player1 = Player.new("プレイヤー1") #プレイヤー1を設定
        player2 = Player.new("プレイヤー2") #プレイヤー2を設定

        cards = @deck.shuffle_deck #デッキをシャッフル
        player1_deck, player2_deck = cards.each_slice(52 / 2).to_a#カードを均等に配る

        puts "カードが配られました。"

        loop do
            break if player1_deck.empty? || player2_deck.empty? #プレイヤーたちのデッキが0になるまで繰り返す処理 条件式をわかりやすく
            
            puts "戦争！"

            player1_card = player1_deck.shift #プレイヤー1が出したカード
            player2_card = player2_deck.shift #プレイヤー2が出したカード

            puts "プレイヤー1のカードは#{player1_card}です。"
            puts "プレイヤー2のカードは#{player2_card}です。"
            value = Card.new #initializeでvalueを設定したら正しく動かなかったため、一旦ここでCardから引用
            player1_value = value.value[player1_card] # カードの値を読み取る
            player2_value = value.value[player2_card]

                if player1_value > player2_value #ここで勝敗を決める
                    puts "プレイヤー1が勝ちました。"
                    player1.stacks.push(player1_card, player2_card) #場札をスタックに送る
                    puts "プレイヤー1が勝ちました。プレイヤー1はカードを#{player1_card.length}枚もらいました。"
                    player1.stacks.clear
                elsif player1_value < player2_value
                    puts "プレイヤー2が勝ちました。"
                    player2.stacks.push(player1_card, player2_card) #場札をスタックに送る
                    puts "プレイヤー2が勝ちました。プレイヤー2はカードを#{player2_card.length}枚もらいました。"
                    player2.stacks.clear
                else 
                    puts "引き分けです。"
                        redo #もう一回戦争をする　ここのredoで既に場に出ているカードがスタックされるか？
                end
        end #loopの区切り


        # player1.stacks.shuffle_deck #スタックをシャッフル
        # player1.stacks.push(player1_deck) #デッキに加えなおす
        # next # ループの最初に戻る

        # player2.stacks.shuffle_deck
        # player2.stacks.push(player2_deck)
        # next # ループの最初に戻る


        if player1_deck.empty? && player1.stacks.empty?   #デッキと手札両方空なら決着
            puts "プレイヤー1の手札がなくなりました"
            puts "プレイヤー1の手札の枚数は0枚です。プレイヤー2の手札の枚数は52枚です。"
            puts "プレイヤー2が1位、プレイヤー1が2位です。"
        elsif player2_deck.empty? && player2.stacks.empty?
            puts "プレイヤー2の手札がなくなりました"
            puts "プレイヤー1の手札の枚数は52枚です。プレイヤー2の手札の枚数は0枚です。"
            puts "プレイヤー1が1位、プレイヤー2が2位です。"
        end

        puts "戦争を終了します。"
    end
end
game = Game.new
game.wargame