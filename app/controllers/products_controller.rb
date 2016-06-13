class ProductsController < ApplicationController
  before_action :product, only: [:show, :edit, :update, :destroy]
  before_action :categories, only: [:edit, :new, :edit]

  def index
    @products = Product.all
  end

  def show
    # TODO: Consider with local timezeone
    @comments = Comment.order(created_at: :asc)
    @comment = Comment.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "created product #{@product.name}"
      redirect_to "/products/#{@product.id}"
    else
      categories
      flash[:alert] = @product.errors
      render 'products/new'
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "updated product :#{@product.id} #{@product.name}"
      redirect_to "/products/#{@product.id}"
    else
      flash[:alert] = "update failded #{@product.errors}"
      render "products/edit"
    end
  end

  def destroy
    if @product.destroy
      flash[:notice] = "deleted Product #{@product.id} #{@product.name}"
      redirect_to '/products'
    else
      flash[:alert] = "deleted failed #{@product.id} #{@product.name}"
      render 'products/index'
    end
  end


  private

  def product_params
    params.require(:product).permit(:name, :description, :pricing, :category_id)
  end

  def product
    @product = Product.find_by_id(params[:id])
  end

  def categories
    @categories = Category.select(:id, :name)
  end

end
