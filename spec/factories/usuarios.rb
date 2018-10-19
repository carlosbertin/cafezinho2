FactoryBot.define do
  factory :usuario do
    nome { Faker::Artist.name }
    cpf { Faker::Number.leading_zero_number(11) }
  end

  # No console (rails c) terei que chamar a classe FactoryBot.
  # Ex: usu1 = FactoryBot.create(:usuario)
  # No teste (usuario_spec.rb) não é necessário chamar a classe FactoryBot
end