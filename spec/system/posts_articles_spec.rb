require 'rails_helper'

RSpec.describe "PostsArticles", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'creating new article' do
    before do
      visit new_article_path
    end

    it 'shows the form' do
      expect(page).to have_text 'New Article'
    end

    describe 'Then submitting article data' do
      before do
        fill_in 'Title', with: 'My First Article'
        fill_in 'Body', with: 'Hello, Yabe'

        click_button 'Create'
      end

      it 'shows posted new article' do
        expect(page).to have_text 'My First Article'
        expect(page).to have_text 'Hello, Yabe'
      end
    end
  end
end
