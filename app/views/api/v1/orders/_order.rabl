object @order

attributes :token, :created_at, :total

node(:store_name) { |order| order.try(:seller)..try(:store).try(:name) }
