class User < ActiveRecord::Base
  has_many :user_restaurants
  has_many :restaurants, through: :user_restaurants

  @@signed_in = nil

  def self.signed_in
  	@@signed_in ? self.all.find(@@signed_in) : false
  end

  def sign_in
  	@@signed_in = self.id
  end

end
