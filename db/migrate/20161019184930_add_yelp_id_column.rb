class AddYelpIdColumn < ActiveRecord::Migration
  def change
  	add_column :restaurants, :yelp_api_id, :string 
  end
end
