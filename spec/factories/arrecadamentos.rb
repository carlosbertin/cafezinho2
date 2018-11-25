FactoryBot.define do
  
  factory :arrecadamento do
    association :usuario
    #association :usuario, factory: :usuario, id: 1
    
    # trait :with_existing_usuario do
    #   usuario { Usuario.last }
    # end

    association :arrecadacao
    #association :arrecadacao, factory: :arrecadacao, id: 1

    # trait :with_existing_arrecadacao do
    #   arrecadacao { Arrecadacao.last }
    # end
  
    valor_pago { Faker::Number.leading_zero_number(2) }
  end

  # No console (rails c) terei que chamar a classe FactoryBot.
  # Ex: am1 = FactoryBot.create(:arrecadamento)
  # No teste (arrecadamento_spec.rb) não é necessário chamar a classe FactoryBot
  # Para criar 10 arrecadamentos, rodar o bloco abaixo:
  #   10.times.each do |am|
  #     FactoryBot.create(:arrecadamento)
  #   end
end