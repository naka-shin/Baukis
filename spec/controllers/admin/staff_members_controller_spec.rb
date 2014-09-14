require 'rails_helper'

describe Admin::StaffMembersController, 'ログイン前' do
  it_behaves_like 'a protected admin controller'
end

describe Admin::StaffMembersController do
  let(:params_hash) { attributes_for(:staff_member) }
  let(:administrator) { create(:administrator) }

  before do
    session[:administrator_id] = administrator.id
    session[:last_access_time] = 1.second.ago
  end

  describe '#create' do
    example '職員一覧ページにリダイレクト' do
      post :create, staff_member: params_hash
      expect(response).to redirect_to(admin_staff_members_url)
    end

    example '例外ActionController::ParameterMissingが発生' do
      bypass_rescue
      expect { post :create }.
        to raise_error(ActionController::ParameterMissing)
    end
  end
end
