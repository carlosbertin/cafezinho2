FactoryBot.define do
    factory :arrecadamento do
      usuario
      arrecadacao
      valor_pago { Faker::Number.leading_zero_number(2) }
    end
end