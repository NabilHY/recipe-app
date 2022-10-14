require 'rails_helper'
require 'ffi'

RSpec.describe Recipe, type: :model do
  subject do
    user = User.new(name: 'user')
    Recipe.new(user:, name: 'Paella recipe', preparation_time: '15 Minutes', cooking_time: '30 Minutes',
               description: 'Spanish dish made of spicy rice and sea food', public: true)
  end

  it 'returns the user name' do
    name = subject.user.name
    expect(name).to eq('user')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'name is valid' do
    expect(subject.name).to eq('Paella recipe')
  end

  it 'prepation_time is valid' do
    expect(subject.preparation_time).to eq('15 Minutes')
  end

  it 'cooking_time is valid' do
    expect(subject.cooking_time).to eq('30 Minutes')
  end

  it 'description is valid' do
    expect(subject.description).to eq('Spanish dish made of spicy rice and sea food')
  end

  it 'public is valid' do
    expect(subject.public).to eq(true)
  end
end
