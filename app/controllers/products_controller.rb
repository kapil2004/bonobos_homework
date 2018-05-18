class ProductsController < ApplicationController

  def search
    if params[:term] && product = Product.search(params[:term])
      render json: product
    else
      render json: { product: {} }
    end
  end

end
