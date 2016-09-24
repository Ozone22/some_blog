require 'rails_helper'

describe Category do

  before do

    params = { title: 'SomeCategory' }

    @category = Category.new(params)

  end

  subject { @category }

  it { should respond_to(:title) }
  it { should be_valid }

  describe 'when title not present' do

    before { @category.title = '' }

    it { should_not be_valid }

  end

  describe 'when title too short' do

    before { @category.title = 'a' }

    it { should_not be_valid }

  end

  describe 'when title too long' do

    before { @category.title = 'a' * 51 }

    it { should_not be_valid }

  end

  describe 'when articles have a category' do

    before do
      @category.save
      @article = FactoryGirl.create(:article, category: @category)
    end

    specify { expect(@category.articles.length).to eql 1 }
    specify { expect(@category.articles).to include @article }
  end

end