require 'rails_helper'

RSpec.feature "Users navigate to product details", type: :feature, js: true do
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

  scenario "when they click on a product" do
    visit root_path

    # find article by id, then find relevant clickable
    page.find('#product_1').find('img').click
    # expect path to change to product details
    expect(page).to have_current_path('/products/1')
    # page now has article with class product-detail
    page.has_css?(".product-detail")

    # commented out b/c it's for debugging only
    # save_and_open_screenshot
  end
end
