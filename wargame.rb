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

    cards = @deck.shuffle_deck  #デッキをシャッフル
    player1.deck, player2.deck = cards.each_slice(52 / 2).to_a #カードを均等に配る

    puts "カードが配られました。"
    t_storage = [] # 引き分け時に場に出るカードを保持する配列

    loop do
      if player1.deck.empty? && player1.stacks.empty? #プレイヤー1のデッキと手札両方空なら決着
        puts "プレイヤー1の手札がなくなりました"
        puts "プレイヤー1の手札の枚数は0枚です。プレイヤー2の手札の枚数は52枚です。"
        puts "プレイヤー2が1位、プレイヤー1が2位です。"
        break

      elsif player2.deck.empty? && player2.stacks.empty? #プレイヤー2のデッキと手札両方空なら決着
        puts "プレイヤー2の手札がなくなりました"
        puts "プレイヤー1の手札の枚数は52枚です。プレイヤー2の手札の枚数は0枚です。"
        puts "プレイヤー1が1位、プレイヤー2が2位です。"
        break
      end

      puts "戦争！"

      player1_card = player1.deck.shift #プレイヤー1が出したカード
      player2_card = player2.deck.shift #プレイヤー2が出したカード

      t_storage.push(player1_card, player2_card) #場に出たカードを一時保存する

      puts "プレイヤー1のカードは#{player1_card}です。"
      puts "プレイヤー2のカードは#{player2_card}です。"
      value = Card.new #一旦ここでCardから引用
      player1_value = value.value[player1_card] # カードの値を読み取る
      player2_value = value.value[player2_card] 

      if player1_value > player2_value #プレイヤー1が勝ちの場合
        player1.stacks.concat(t_storage) #場札をスタックに送る 
        puts "プレイヤー1が勝ちました。プレイヤー1はカードを#{t_storage.size}枚もらいました。" #ここでt_storageを使うため、concatを使用
        t_storage.clear

      elsif player1_value < player2_value #プレイヤー2が勝ちの場合
        player2.stacks.concat(t_storage) 
        puts "プレイヤー2が勝ちました。プレイヤー2はカードを#{t_storage.size}枚もらいました。"
        t_storage.clear

      else
        puts "引き分けです。"
      end

      if player1.deck.empty? && !player1.stacks.empty? #プレイヤー1のデッキが0で、スタックが0でない場合
        player1.deck = player1.stacks.shuffle  #スタックをシャッフルしたものをデッキに加えなおす
        player1.stacks.clear 
      end

      if player2.deck.empty? && !player2.stacks.empty? #プレイヤー2のデッキが0で、スタックが0でない場合
        player2.deck = player2.stacks.shuffle  #スタックをシャッフルしたものをデッキに加えなおす
        player2.stacks.clear
      end
    end #loopの区切り

    puts "戦争を終了します。"
  end
end