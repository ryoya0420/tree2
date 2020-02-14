class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    #binding.pry
     #@product = Product.new(name: params[:product][:name], image: params[:product][:image], price: params[:product][:price])
     #byebug
    if @product.save
      redirect_to products_path, success: '商品登録完了'
    else
      flash.now[:danger] = '商品登録失敗'
      render :new
    end
  end
  
  def show
    @product = Product.find_by(id: params[:id])
  end
  
  def edit
    @product = Product.find_by(product_params)
  end
  
  def update
    @product = Product.find_by(product_params)
    @product.save
    redirect_to product_path, success: "変更完了"
  end
  
  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    redirect_to product_path, success: "削除しました"
  end
  
  private
  def product_params
    params.require(:product).permit(:name, :image, :price)
  end
end
