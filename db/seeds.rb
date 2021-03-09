# frozen_string_literal: true

require 'json'

puts 'seeding db from data.json'

data = JSON.parse(File.open('data.json').read)

puts 'creating users'
users = data['users']

users.map do |user|
  uid = user['id']

  user = User.find_or_create_by!(uid: uid)

  user.update!(
    uid: uid,
    btc_balance: user['btc_balance'],
    eur_balance: user['eur_balance']
  )
end

puts 'users created'

puts 'creating queued_orders'

queued_orders = data['queued_orders']

queued_orders.map do |q|

  QueuedOrder.create!(
    user_id: q['user_id'],
    direction: q['direction'],
    btc_amount: q['btc_amount'],
    price: q['price']
  )
end

puts 'queued_orders created'

