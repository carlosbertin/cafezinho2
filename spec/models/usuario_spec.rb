require 'rails_helper'

# if you are using rspec-rails then you can run using rake spec
# if you're testing models, use rake spec:models (or rake spec:routing or rake spec:controllers)
# if just testing one model, use rake SPEC=app/models/modelname.rb

RSpec.describe Usuario do
  #pending "add some examples to (or delete) #{__FILE__}"
  # context 'validations' do
  #   before { FactoryGirl.build(:user) }

  #   it do
  #     should validate_uniqueness_of(:username).
  #       scoped_to(:account_id).
  #       case_insensitive
  #   end
  # end
  context 'validações' do
    it { should validate_presence_of(:nome) }
    it { should validate_presence_of(:cpf) }
  end

end
