require 'rails_helper'

describe 'Admin articles pages' do

  subject { page }

  let(:admin) { FactoryGirl.create(:admin) }

  before do
    @category = FactoryGirl.create(:category)
    @article = FactoryGirl.create(:article, article_image: nil)
    sign_in admin
  end

  describe 'index page' do

    before { visit admin_articles_path }

    it { should have_content('Статьи') }
    it { should have_link(nil, href: new_admin_article_path) }
    it { should have_link(@article.title, href: admin_article_path(@article)) }
    it { should have_link(nil, href: edit_admin_article_path(@article)) }
    it { should have_link('удалить', href: admin_article_path(@article)) }

  end

  describe 'new page' do

    before { visit new_admin_article_path }

    describe 'fill with invalid data' do

      before { click_button 'Создать' }

      it { should have_selector('div.alert.alert-danger') }
      it { should have_content('Создание статьи') }

    end

    describe 'fill with valid data' do

      before do
        fill_in 'Заголовок', with: 'newArticle!'
        select @category.title, from: 'Категория'
        attach_file 'Изображение', "#{Rails.root}/spec/fixtures/images/default_article_image.jpeg"
        fill_in 'Содержимое', with: 'Coolest content!'
        click_button 'Создать'
      end

      it { should have_selector('div.alert.alert-info') }
      it { should have_content('newArticle!') }
      it { should have_content('Статья успешно создана') }
      it { should have_content('Coolest content!') }
      it { should have_link(@category.title, href: admin_categories_path) }
    end


  end

  describe 'show page' do

    before { visit admin_article_path(@article) }

    it { should have_content(@article.title) }
    it { should have_content(@article.content) }
    it { should have_link(@article.category.title, href: admin_categories_path) }
  end

  describe 'edit page' do

    before do
      visit edit_admin_article_path(@article)
      fill_in 'Заголовок', with: 'newTitle'
      click_button 'Изменить'
    end

    it { should have_selector('div.alert.alert-info') }
    it { should have_content('newTitle') }
    specify { expect(@article.reload.title).eql?('newTitle') }

  end



end