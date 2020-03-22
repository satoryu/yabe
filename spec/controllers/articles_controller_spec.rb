require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe "GET #index" do
    it 'returns http success' do
      skip 'Implement after allowing users to post articles'
      get :index

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new

      expect(response).to have_http_status(:success)
      expect(assigns(:article)).to be_a(Article)
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'Given valid parameters' do
      it 'creates new article' do
        post :create, params: { article: attributes_for(:article) }

        article = assigns(:article)
        expect(article).to be_a(Article)
        expect(article).to be_persisted
        expect(response).to redirect_to article_path(article)
      end
    end
    context 'Givne invalid parameters' do
      context 'empty parameter' do
        it 'renders the form' do
          pending 'need a policy for how handling ParameterMissing exception'
          post :create, params: {}

          expect(response).to render_template(:new)
        end
      end
      context 'title is blank' do
        it 'renders the form' do
          post :create, params: { article: { title: '', body: 'Hello, Yabe'} }

          expect(response).to render_template(:new)
        end
      end
      context 'body is empty' do
        it 'renders the form' do
          post :create, params: { article: { title: 'Hello', body: '' }}

          expect(response).to render_template(:new)
        end
      end
    end
  end

  describe "GET #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
