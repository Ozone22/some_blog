require 'rails_helper'

describe 'Admin category pages' do

  subject { page }

  let(:admin) { FactoryGirl.create(:admin) }

  before do
    @category = FactoryGirl.create(:category)
    @article = FactoryGirl.create(:article, category: @category, article_image: nil)
    sign_in admin
  end

  describe 'new page' do
    before do
      visit new_admin_category_path
      fill_in 'Заголовок', with: 'TestTitle'
      click_button 'Создать'
    end

    it { should have_selector('div.alert-info') }
    it { should have_content('Успешно создана') }
    it { should have_content('TestTitle') }

  end

  describe 'show page' do
    before { visit admin_category_path(@category) }

    it { should have_content(@category.title) }
    it { should have_link(@article.title, href: admin_article_path(@article)) }
  end

  describe 'index page' do
    before { visit admin_categories_path }

    it { should have_link(@category.title, href: admin_category_path(@category)) }
    it { should have_link('изменить', href: edit_admin_category_path(@category)) }
    it { should have_link('удалить', href: admin_category_path(@category)) }
  end

  describe 'edit page' do
    before do
      visit edit_admin_category_path(@category)
      fill_in 'Заголовок', with: 'AnotherTitle'
      click_button 'Изменить'
    end

    it { should have_selector('div.alert-info') }
    it { should have_content('Успешно изменена') }
    it { should have_content('AnotherTitle') }
    specify { expect(@category.reload.title).to eql('AnotherTitle') }
  end

  describe 'delete' do
    before do
      visit admin_categories_path
      click_link 'удалить', href: admin_category_path(@category)
    end

    it { should have_content('удалено') }
    it { should_not have_content(@category.title) }
  end

end