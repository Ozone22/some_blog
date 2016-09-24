require 'rails_helper'

describe Article do

  before do

    params = { title: 'SomeTitle', content: 'SomeContent', category: FactoryGirl.create(:category) }

    @article = Article.new(params)

  end

  subject { @article }

  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:category) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }

  it { should be_valid }

  describe 'when title not present' do

    before { @article.title = '' }

    it { should_not be_valid }

  end

  describe 'when title too short' do

    before { @article.title = 'a' }

    it { should_not be_valid }

  end

  describe 'when title too long' do

    before { @article.title = 'a' * 90 }

    it { should_not be_valid }

  end

  describe 'when content not present' do

    before { @article.content = '' }

    it { should_not be_valid }

  end

  describe 'when category not present' do

    before { @article.category = nil }

    it { should_not be_valid }

  end
  
end
