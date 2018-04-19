class User < ApplicationRecord
	include ImageUploader::Attachment.new(:profile_image)
	validates :contact, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  ROLES = %w[admin trainer trainee ].freeze
  
  def admin?
  	self.role == "admin"
  end

  def trainer?
  	self.role == "trainer"
  end

  def trainee?
  	self.role == "trainee"
  end
end
