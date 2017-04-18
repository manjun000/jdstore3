class ProductsController < ApplicationController

  before_action :authenticate_user! , only: [:favourite, :unfavourite]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "你已成功将 #{@product.title}加入购物车"
    else
      flash[:warning] = "你的购物车内已有此物品"
    end
    redirect_to :back
  end

  def favourite
    @product = Product.find(params[:id])

    if !current_user.has_been_favourited?(@product)
       current_user.favourite!(@product)
       flash[:notice]  = "收藏成功"
    else
       flash[:warning] = "已收藏"
    end
    redirect_to products_path
  end

  def unfavourite
    @product = Product.find(params[:id])

    if current_user.has_been_favourited?(@product)
       current_user.unfavourite!(@product)
       flash[:notice] = "已取消收藏"
    else
      flash[:warning] = "没有收藏，怎么取消收藏, XD"
    end
    redirect_to products_path
  end
end
