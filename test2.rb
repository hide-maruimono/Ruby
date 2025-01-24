# #ゲームの中身
# require_relative 'card' # card.rb を読み込む
# require_relative 'deck' # deck.rb を読み込む
# require_relative 'player' # player.rb を読み込む

# class Game 
#     def initialize
#         @deck = Deck.new
#     end

#     def wargame
#         puts "戦争を開始します。"
                
#         player1 = Player.new("プレイヤー1") #プレイヤー1を設定
#         player2 = Player.new("プレイヤー2") #プレイヤー2を設定

#         cards = @deck.shuffle_deck #デッキをシャッフル
#         player1_deck, player2_deck = cards.each_slice(52 / 2).to_a#カードを均等に配る

#         puts "カードが配られました。"
#         t_storage = [] # 引き分け時に場に出るカードを保持する配列

#         loop do
#             if player1_deck.empty? && player1.stacks.empty?
#                 puts "プレイヤー1の手札がなくなりました"
#                 puts "プレイヤー1の手札の枚数は0枚です。プレイヤー2の手札の枚数は52枚です。"
#                 puts "プレイヤー2が1位、プレイヤー1が2位です。"
#                 break

#             elsif player2_deck.empty? && player2.stacks.empty?
#                 puts "プレイヤー2の手札がなくなりました"
#                 puts "プレイヤー1の手札の枚数は52枚です。プレイヤー2の手札の枚数は0枚です。"
#                 puts "プレイヤー1が1位、プレイヤー2が2位です。"
#                 break
#             end

#             puts "戦争！"

#             player1_card = player1_deck.shift #プレイヤー1が出したカード
#             player2_card = player2_deck.shift #プレイヤー2が出したカード

#             t_storage.push(player1_card, player2_card) #場に出たカードを一時保存する

#             puts "プレイヤー1のカードは#{player1_card}です。"
#             puts "プレイヤー2のカードは#{player2_card}です。"
#             value = Card.new #initializeでvalueを設定したら正しく動かなかったため、一旦ここでCardから引用
#             player1_value = value.value[player1_card] # カードの値を読み取る
#             player2_value = value.value[player2_card]

#                 if player1_value > player2_value #ここで勝敗を決める
#                     player1.stacks.push(t_storage) #場札をスタックに送る
#                     puts "プレイヤー1が勝ちました。プレイヤー1はカードを#{t_storage.size}枚もらいました。"
#                     t_storage.clear
#                     player2_deck.empty? #プレイヤーたちのデッキが0になるまで繰り返す処理 条件式をわかりやすく
#                     player2.stacks.shuffle #スタックをシャッフル
#                     player2_deck.push(player2.stacks) #デッキに加えなおす
                        
#                     next #もう一回戦争をする　

#                 elsif player1_value < player2_value
#                     player2.stacks.push(t_storage) #場札をスタックに送る
#                     puts "プレイヤー2が勝ちました。プレイヤー2はカードを#{t_storage.size}枚もらいました。"
#                     t_storage.clear
#                     player1_deck.empty? #プレイヤーたちのデッキが0になるまで繰り返す処理 条件式をわかりやすく
#                     player1.stacks.shuffle #スタックをシャッフル
#                     player1_deck.push(player1.stacks) #デッキに加えなおす
#                     next #もう一回戦争をする　
#                 else 
#                     puts "引き分けです。"
#                     next #もう一回戦争をする　
#                 end
#         end #loopの区切り


#         # player1.stacks.shuffle_deck #スタックをシャッフル
#         # player1.stacks.push(player1_deck) #デッキに加えなおす
#         # next # ループの最初に戻る

#         # player2.stacks.shuffle_deck
#         # player2.stacks.push(player2_deck)
#         # next # ループの最初に戻る


#         # if player1_deck.empty? && player1.stacks.empty?   #デッキと手札両方空なら決着
#         #     puts "プレイヤー1の手札がなくなりました"
#         #     puts "プレイヤー1の手札の枚数は0枚です。プレイヤー2の手札の枚数は52枚です。"
#         #     puts "プレイヤー2が1位、プレイヤー1が2位です。"
#         # elsif player2_deck.empty? && player2.stacks.empty?
#         #     puts "プレイヤー2の手札がなくなりました"
#         #     puts "プレイヤー1の手札の枚数は52枚です。プレイヤー2の手札の枚数は0枚です。"
#         #     puts "プレイヤー1が1位、プレイヤー2が2位です。"
#         # end

#         puts "戦争を終了します。"
#     end
# end
# game = Game.new
# game.wargame



require_relative 'card'
require_relative 'deck'
require_relative 'player'

class Game
  def initialize
    @deck = Deck.new
  end

  def wargame
    puts "戦争を開始します。"

    player1 = Player.new("プレイヤー1")
    player2 = Player.new("プレイヤー2")

    cards = @deck.shuffle_deck
    player1.deck, player2.deck = cards.each_slice(52 / 2).to_a

    puts "カードが配られました。"
    t_storage = []

    loop do
      if player1.deck.empty? && player1.stacks.empty?
        puts "プレイヤー1の手札がなくなりました"
        puts "プレイヤー1の手札の枚数は0枚です。プレイヤー2の手札の枚数は52枚です。"
        puts "プレイヤー2が1位、プレイヤー1が2位です。"
        break

      elsif player2.deck.empty? && player2.stacks.empty?
        puts "プレイヤー2の手札がなくなりました"
        puts "プレイヤー1の手札の枚数は52枚です。プレイヤー2の手札の枚数は0枚です。"
        puts "プレイヤー1が1位、プレイヤー2が2位です。"
        break
      end

      puts "戦争！"

      player1_card = player1.deck.shift
      player2_card = player2.deck.shift

      t_storage.push(player1_card, player2_card)

      puts "プレイヤー1のカードは#{player1_card}です。"
      puts "プレイヤー2のカードは#{player2_card}です。"
      value = Card.new
      player1_value = value.value[player1_card]
      player2_value = value.value[player2_card]

      if player1_value > player2_value
        player1.stacks.concat(t_storage)
        puts "プレイヤー1が勝ちました。プレイヤー1はカードを#{t_storage.size}枚もらいました。"
        t_storage.clear

      elsif player1_value < player2_value
        player2.stacks.concat(t_storage)
        puts "プレイヤー2が勝ちました。プレイヤー2はカードを#{t_storage.size}枚もらいました。"
        t_storage.clear

      else
        puts "引き分けです。"
      end

      if player1.deck.empty? && !player1.stacks.empty?
        player1.deck = player1.stacks.shuffle
        player1.stacks.clear
      end

      if player2.deck.empty? && !player2.stacks.empty?
        player2.deck = player2.stacks.shuffle
        player2.stacks.clear
      end
    end

    puts "戦争を終了します。"
  end
end

game = Game.new
game.wargame