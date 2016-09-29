require 'rails_helper'

describe 'Category' do

  before { @category = FactoryGirl.create(:category) }

  subject { page }


  describe 'sidebar' do

    before { visit root_path }

    it { should have_link(@category.title, href: category_path(@category)) }
    it { should have_link(nil, href: categories_path) }

  end

  describe 'index page' do

    before { visit categories_path }

    it { should have_link(@category.title, href: category_path(@category)) }
    it { should have_content('Категории') }

  end

  describe 'show page' do

    before do
      @article = FactoryGirl.create(:article, category: @category, article_image: nil)
      visit category_path(@category)
    end

    it { should have_link(@category.title, href: category_path(@category)) }
    it { should have_content(@article.title) }
    it { should have_content(@article.content) }
    it { should have_link(nil, href: article_path(@article)) }

  end

end