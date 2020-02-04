class ProductsController < ApplicationController
	before_action :find_product, only: [:edit, :update, :destroy]
	
	def index
		@products = Product.all
	end
	
	def new
		@product = Product.new
	end
	
	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to products_path, notice: "新增商品成功!"
		else
			render :new
		end
	end
	
	def edit
	end	
	
	def update
		if @product.update(product_params)
			redirect_to products_path, notice: "資料更新成功!"
		else
			render :edit
		end
	end
	
	def destroy
		@product.destroy if @product
		redirect_to products_path, notice: "已刪除商品資料!"
	end
	
	
	def show
	end
	
	private
	def product_params
		params.require(:product).permit(:title, :description, :price)
	end
	
	def find_product
		@product = Product.find_by(id: params[:id])
	end

end
