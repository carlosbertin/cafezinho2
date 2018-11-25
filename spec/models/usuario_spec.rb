require 'rails_helper'

# Para rodar os testes, tem que se fazer na raiz do projeto:
# carlos@carlos-pc:~/Documentos/RubyOnRails/git/cafezinho2$ rspec spec/models/usuario_spec.rb

# if you are using rspec-rails then you can run using rake spec
# if you're testing models, use rake spec:models (or rake spec:routing or rake spec:controllers)
# if just testing one model, use rake SPEC=app/models/modelname.rb

RSpec.describe Usuario, type: :model do

  # Nos testes de Rspec de Model, temos que que validar (caso exista):
  # métodos, scopes, callbacks(exemplos :before validation, :after create) e relacionamentos.

  describe 'validações' do
  # Seria === context 'validações' do === para quando há condições (if's) a serem verificadas.
  # Ou seja, para verificar os diferentes comportamentos que determinada
  # funcionalidade deverá resultar. Exemplo: ao clicar no combobox Filtro,
  # a tela terá que filtrar os registros conforme o que foi escolhido.
    it { should validate_presence_of(:nome).with_message(' - deve ser preenchido') }
    it { should validate_uniqueness_of(:nome).with_message(' - já cadastrado')  }

    it { should validate_presence_of(:cpf).with_message(' - deve ser preenchido') }
    it { should validate_uniqueness_of(:cpf).with_message(' - já cadastrado')  }
  end

  describe 'relacionamentos' do
      it { should have_many(:arrecadamentos) }
      it { should have_many(:arrecadacoes).through(:arrecadamentos) }
  end

  describe 'Scopes' do
     let!(:usuario_sem_pagamento) { create(:usuario) }
     let(:usuario_com_pagamento) { create(:usuario) }
     let(:arrecadacao) { create(:arrecadacao) }
     let!(:arrecadamento) { create(:arrecadamento, usuario: usuario_com_pagamento, arrecadacao: arrecadacao) }

     describe 'usuario_com_pagamento' do
       it 'retorna usuário que efetuou pagamento em um determinado mês/ano' do
         expect(Usuario.usuario_com_pagamento(arrecadamento.id)).to match_array(usuario_com_pagamento)
       end
    end

     describe 'usuario_pendente_pagamento' do
       it 'retorna usuário que ainda NÃO efetuou pagamento em um determinado mês/ano' do
          expect(Usuario.usuario_pendente_pagamento(arrecadamento.id)).to match_array(usuario_sem_pagamento)
       end
     end
   end

end