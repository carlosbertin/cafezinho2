FactoryBot.define do

    factory :arrecadacao do
        mes_ano_sorteado = Faker::Date.between_except(5.year.ago, 1.year.from_now, Date.today)
        mes_ano { mes_ano_sorteado.strftime("%B/%Y") }
        valor_base { Faker::Number.leading_zero_number(2) }
    end

    # No console (rails c) terei que chamar a classe FactoryBot.
    # Ex: ac1 = FactoryBot.create(:arrecadacao)
    # No teste (arrecadacao_spec.rb) não é necessário chamar a classe FactoryBot
    # Para criar 3 arrecadacoes, rodar o bloco abaixo:
    #   3.times.each do |ar|
    #     FactoryBot.create(:arrecadacao)
    #   end
end