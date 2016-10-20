class YelpApi

	@@history = []

	def self.client
		@client ||= Yelp::Client.new({
		  consumer_key: 'jJeOoPuLKqFTB6lxGA47MQ',
		  consumer_secret: 'F3EXXdQVFtaLdOp89RC629orE6s',
		  token: 'FaHJVYy6GFP88mkhZpNbogqUGIsCXrbL',
		  token_secret: '8xQd6FJgeEBhPWKid5OCVKZmdhA'
		})
	end

	def self.history
		@@history
	end

	def self.search(query, page = 1, sort_method = 2)
		@@history << query if page == 1
		my_offset = (page - 1) * 20
		businesses = self.client.search(query[:location],
			{term: query[:term], offset: my_offset, sort: sort_method}).businesses
		self.build_results(businesses)
	end

	def self.build_results(businesses)
		businesses.map do |business|
			Restaurant.find_or_create_by(
				name: business.name, yelp_api_id: business.id,
				address: business.location.display_address.join(", "),
				rating: business.rating, rating_img_url: business.rating_img_url,
				yelp_url: business.url, img_url: business.image_url
			)
		end
	end
end