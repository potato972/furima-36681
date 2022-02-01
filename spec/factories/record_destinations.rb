FactoryBot.define do
  factory :record_destination do
    token { 'tok_abcdefghijk00000000000000000' }

    post_code       { '999-9999' }
    area_id         { 2 }
    municipalities  { '上越市台中区' }
    address         { '5555' }
    building        { 'ビル555' }
    tel             { '0120000000' }
  end
end
