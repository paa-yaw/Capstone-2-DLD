class Category < ActiveRecord::Base
	has_many :artworks, dependent: :destroy
end
