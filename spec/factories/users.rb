FactoryBot.define do
  factory :user do
    nickname              {"yamada"}
    email                 {"sample@gmail.com"}
    password              {"123456a"}
    encrypted_password    {"123456a"}
    last_name             {"山田"}
    first_name            {"花子"}
    last_name_reading     {"ヤマダ"}
    first_name_reading    {"タロウ"}
    birthday              {"2000-01-01"}
  end
end
