require 'rails_helper'

describe 'Article pages' do

  subject { page }

  let(:article) { FactoryGirl.create(:article) }

  describe 'sidebar' do

    before { visit root_path }

    it { should have_link(nil, href: articles_path) }

  end

  describe 'index page' do

    before do
      @new_article = FactoryGirl.create(:article)
      visit root_path
    end

    it { should have_link(nil, href: new_user_session_path) }
    it { should have_link(nil, href: new_user_registration_path) }
    it { should have_link(nil, href: category_path(@new_article.category)) }
    it { should have_content(@new_article.content) }
    it { should have_link(nil, href: article_path(@new_article)) }

    describe 'Admin link' do

      let(:admin) { FactoryGirl.create(:admin) }

      before { sign_in admin }

      it { should have_link(nil, href: admin_root_path) }

    end

  end

  describe 'show page' do

    before { visit article_path(article) }

    it { should have_content(article.title) }
    it { should have_content(article.content) }
    it { should have_link(article.category.title, href: category_path(article.category)) }

  end

end