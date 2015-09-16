class Artwork < ActiveRecord::Base
  belongs_to :user
	has_many :comments
	belongs_to :category
	

	
	has_attached_file :image, styles: {medium: "300x300#", large: "600x500>"}
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
