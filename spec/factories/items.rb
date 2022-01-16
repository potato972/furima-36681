FactoryBot.define do
  factory :item do
    item_name    {"あ行"}
    content      {"あいうえお"}
    category_id  {12}
    status_id    {7}
    postage_id   {2}
    area_id      {2}
    day_id       {2}
    price        {'300'}
    association :user

  end
end
