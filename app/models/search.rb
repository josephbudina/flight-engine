class Search < ApplicationRecord
  belongs_to :user

  validates :origin, uniqueness: true, on: :create, presence: true
  validates :destination, uniqueness: true, on: :create, presence: true
  validates :passengers, uniqueness: true, on: :create, presence: true
  validates :departure, uniqueness: true, on: :create, presence: true
end