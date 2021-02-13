FactoryBot.define do
  factory :purchase_history_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '111-0111' }
    prefecture { 2 }
    city { '小樽市' }
    block_number { '2-2' }
    building_name { '右京' }
    phone_number { '09088886666' }
  end
end
