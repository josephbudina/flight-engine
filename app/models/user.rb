class User < ApplicationRecord
  has_many :searches
  has_secure_password

  validates :email, uniqueness: true, on: :create, presence: true
  validates_presence_of :password, require: true
  validates :password, confirmation: { case_sensitive: true }
  before_save :create_api_key

  def create_api_key
    self.api_key = SecureRandom.uuid
  end
end