require 'rails_helper'

RSpec.describe 'Payment', type: :model do
  before do
    user = User.new(name: 'Jamie', email: 'jamie@gmail.com', password: 'jamiepass')
    user.skip_confirmation!
    user.save!
    group = Group.new(name: 'Group 1', icon: 'group.png', user_id: user.id)
    group.save!
    payment = Payment.new(name: 'Payment 1', amount: 100, user_id: user.id)
    payment.save!
  end

  it 'should be valid' do
    expect(Payment.first).to be_valid
  end

  it 'should be invalid' do
    payment = Payment.new(name: 'Payment 1', amount: 100, user_id: 1)
    expect(payment).to_not be_valid
  end
end
