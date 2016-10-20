class AddRatingImgUrlColumn < ActiveRecord::Migration
  def change
  	add_column :restaurants, :rating_img_url, :string 
  end
end
