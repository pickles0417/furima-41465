FactoryBot.define do
  factory :order_form do
    user_id { association :user }
    item_id { association :item }
    postcode { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    block { '1-1' }
    building { '東京ハイツ' }
    phone_number { '09000980987' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
