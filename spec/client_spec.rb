require 'rspec'
require_relative '../lib/classes/client'

describe Client do
  it 'Customer Class accept valued and return Customer format' do
    expect(Client.new("1", "Mohamed Zahid", "zahid@test.com").client)
  end
end
