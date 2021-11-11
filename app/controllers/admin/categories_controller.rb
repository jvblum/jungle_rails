class Admin::CategoriesController < ApplicationController
  # Dotenv.load

  # http_basic_authenticate_with name: ENV['BASIC_AUTH_USERNAME'], password: ENV['BASIC_AUTH_PASSWORD']

  def index
    @categories = Category.order(id: :desc).all
    @categories_with_count = []
    @categories.each do |category|
      item = { name: category.name,count: Product.where("category_id = #{category.id}").count}
      @categories_with_count << item
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name,
    )
  end

end