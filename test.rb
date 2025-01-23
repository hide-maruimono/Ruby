# require_relative 'card' # card.rb を読み込む

# card = Card.new

# puts "スート: #{card.suit.shuffle}"
# puts "ナンバー: #{card.number}"

# card = Card.new
# puts card.cards
numbers = (1..52).to_a
n = 52 / 5
array = []
numbers.each_slice(2) do |x|
  # 均等に配る
  array << x
end
print array