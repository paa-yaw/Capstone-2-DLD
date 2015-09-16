class User < ActiveRecord::Base
  has_many :artworks
  has_many :comments

  has_attached_file :profile_pic, styles: {medium: "300x300#", large: "600x500>"}
  validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\Z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
          
  
end
