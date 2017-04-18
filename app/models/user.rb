class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  def admin?
    is_admin
  end

  has_many :orders
  has_many :favourites
  has_many :favourite_products, :through => :favourites, :source => :product

  def has_been_favourited?(product)
    favourite_products.include?(product)
  end

  def favourite!(product)
    favourite_products << product
  end

  def unfavourite!(product)
    favourite_products.delete(product)
  end
end
