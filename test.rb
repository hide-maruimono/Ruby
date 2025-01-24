# require_relative 'card' # card.rb を読み込む
require_relative 'player' # player.rb を読み込む

player1 = Player.new("プレイヤー1")
player1.stacks.push("スペードのA", "スペードのK")
print player1.stacks

player2 = Player.new("プレイヤー2")
player2.stacks.push("ハートのA", "ハートのK")
print player2.stacks

# card = Card.new

# puts "スート: #{card.suit.shuffle}"
# puts "ナンバー: #{card.number}"

# card = Card.new
# puts card.cards
# numbers = (1..52).to_a
# n = 52 / 5
# array = []
# numbers.each_slice(2) do |x|
#   # 均等に配る
#   array << x
# end
# print array

# i = 0
# while i < 10 do
#     puts i
#     i +=1

# end


#繰り返し処理の枠組み
プレイヤーの手札(デッキ) = 26
while プレイヤー1の手札 = 0 or プレイヤー2の手札 = 0 do
    puts i
    i +=1 or i -= 1

    勝った時、そのプレイヤーに+
    負けた時、そのプレイヤーに- を施す

end


array1 = []
array2 = ["a", "b", ""]
hash1 = {}
hash2= {"a" => "1","b" => "2","c" => "3",}

p array1.empty?
p array2.empty?
p hash1.empty?
p hash2.empty?


array = Array["apple", "orange", "", "melon", "", "banana"]

for var in array do
    if var.empty? then
        p "空文字です"
    else
        p var
    end
end

■実際に組み合わせると、、、、
①while ver.
while !player1_deck.empty? && !player2_deck.empty?

end
もしくは
②loop ver.
loop do
    break if player1_deck.empty? || player2_deck.empty?
    
end

配列.push(追加する要素)で末尾に追加する
配列.unshiftは先頭に追加する場合に使う
redoでやり直す
手札が0枚になった際によく切って手札に加えます

loopdoでデッキ0枚までの処理は大丈夫なはず。

1が勝った
→2のデッキは空か？　and 2のスタックは空か？
→空じゃないなら再度頭に戻る
→空なら1の勝利

2が勝った。
→1のデッキは空か? and 1のスタックは空か？
→２の勝利

引き分けは場札を保存しながらやり直して、上の処理。

プレイヤーの子クラスは必要か