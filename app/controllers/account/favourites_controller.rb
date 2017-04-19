class Account::FavouritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = current_user.favourite_products
  end
end
