FactoryBot.define do

    mes_ano_sorteado = Time.at(Time.new(2017).to_f + rand * (Time.now.to_f - Time.new(2019).to_f)).to_date

    factory :arrecadacao do
        mes_ano { mes_ano_sorteado.strftime("%B/%Y") }
        valor_base { Faker::Number.leading_zero_number(2) }
    end
end