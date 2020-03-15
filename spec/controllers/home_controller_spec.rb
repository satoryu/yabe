require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe 'GET #index' do
    before do
      get :index
    end

    context 'When no articles in the system' do
      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
      it { is_expected.to render_template :index }
    end
    context 'When some articles are posted' do
      let!(:article) { create(:article) }

      it 'returns http success' do
        expect(assigns(:articles)).to include(article)
        expect(response).to have_http_status(:success)
      end
      it { is_expected.to render_template :index }
    end
  end

end
