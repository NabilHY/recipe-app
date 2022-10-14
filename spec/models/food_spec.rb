require 'rails_helper'
require 'ffi'

RSpec.describe Food, type: :model do
    subject do
        user = User.new(name: 'user')
        Food.new(name: 'Recipe', measurement_unit: 'g', price: 1, quantity: 1, user: user)
    end

    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end

    it 'is not valid if measurment unit is not g, kg, ml or l' do
        subject.measurement_unit = 'kilograms'
        expect(subject).to be_valid
    end

    it 'is not valid without a name' do
        subject.name = nil
        expect(subject).to_not be_valid
    end

    it 'is not valid without a measurement_unit' do
        subject.measurement_unit = nil
        expect(subject).to_not be_valid
    end

    it 'is not valid without a price' do
        subject.price = nil
        expect(subject).to_not be_valid
    end

    it 'is not valid without a quantity' do
        subject.quantity = nil
        expect(subject).to_not be_valid
    end

    it 'is not valid if quantity isnt an integer' do
        subject.quantity = 'a'
        expect(subject).to_not be_valid
    end

    it 'is not valid if price isnt an integer' do
        subject.price = 'a'
        expect(subject).to_not be_valid
    end

end