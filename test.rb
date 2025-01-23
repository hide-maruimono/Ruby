require_relative 'card' # card.rb を読み込む

card = Card.new
puts "スート: #{card.suit}"
puts "ナンバー: #{card.number}"