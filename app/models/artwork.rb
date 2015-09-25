class Artwork < ActiveRecord::Base
  searchkick
  acts_as_votable
  belongs_to :user
	has_many :comments
	belongs_to :category
  has_many :purchases
	
	has_attached_file :image, styles: {medium: "300x300#", large: "600x500>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :caption, presence: true,
            length: {minimum: 3}

  validates :description, presence: true,
            length: {minimum: 10}

  validates :image, presence: true

  validates :category_id, presence: true

end
