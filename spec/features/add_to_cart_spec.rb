require 'rails_helper'

RSpec.feature "Visitor clicks add to cart", type: :feature, js: true do

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


  scenario "My Cart number increments by 1" do
    visit root_path

    my_cart = page.find(".my-cart")
    expect(my_cart).to have_content("My Cart (0)") # check

    # click add to cart
    page.find('#product_1').find('button').click

    # check if My Cart (1)
    expect(my_cart).to have_content("My Cart (1)")

    # commented out b/c it's for debugging only
    # save_and_open_screenshot
  end

end
