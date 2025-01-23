require_relative 'card' # card.rb を読み込む

card = Card.new

puts "スート: #{card.suit.shuffle}"
puts "ナンバー: #{card.number}"