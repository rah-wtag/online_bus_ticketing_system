require 'rails_helper'

RSpec.describe Ticket, type: :model do
  context 'when creating a ticket' do
    let(:ticket) { FactoryBot.build(:ticket) }
    let(:user) { FactoryBot.build(:user) }
    let(:trip) { FactoryBot.build(:trip) }
    let!(:bus) { FactoryBot.build(:bus) }
    let!(:payment) { FactoryBot.build(:payment) }
    let!(:seat1) { FactoryBot.build(:seat) }
    let!(:seat2) { FactoryBot.build(:seat) }

    it 'ensure total_fere is presence' do
      ticket.total_fare = nil
      expect(ticket.valid?).to eq(false)
    end

    #association testing

    it 'ensure belongs_to user' do
      ticket.user = user
      expect(ticket.user != user).to eq(false)
    end

    it 'ensure belongs_to trip' do
      ticket.trip = trip
      expect(ticket.trip != trip).to eq(false)
    end

    it 'ensure belongs_to bus' do
      ticket.bus = bus
      expect(ticket.bus != bus).to eq(false)
    end

    it 'ensure belongs_to payment' do
      ticket.payment = payment
      expect(ticket.payment != payment).to eq(false)
    end

    it 'ensure has many seats' do
      ticket.seats << [seat1,seat2]
      expect(ticket.seats).to eq([seat1,seat2])
    end


  end
end