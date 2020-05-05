require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end


  scenario "User can click on a product and navigate to product page" do
    # ACT
    p = Product.all.first
      

      visit '/'

      expect(page).to have_text(p.name)

      product_article_elt = page.find(:xpath, '//a/h4', text: p.name)
      # puts product_article_elt
      product_article_elt.click

      # save_screenshot 'clicked_before_expect.png'

      expect(page).to have_selector 'section.products-show'
      # expect(page).to have_selector 'article.product' # this matches on the original page!
      expect(page).to have_text p.name

      # save_screenshot 'clicked_after_expect.png'
  end
end
