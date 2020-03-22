require 'rails_helper'

RSpec.describe "PostsArticles", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'creating new article' do
    it 'shows the form' do
      visit new_article_path

      expect(page).to have_text 'New Article'
    end
  end
end
