require 'rails_helper'

describe 'Static Pages' do

  subject { page }

  describe 'Home page' do

    before { visit root_path }

    it { should have_link(nil, href: new_user_session_path) }
    it { should have_link(nil, href: new_user_registration_path) }

    describe 'Admin link' do

      let(:admin) { FactoryGirl.create(:admin) }

      before { sign_in admin }

      it { should have_link(nil, href: admin_root_path) }
    end

  end

end