class Search < ApplicationRecord
  belongs_to :user

  validates_presence_of :origin
  validates_presence_of :destination
  validates_presence_of :passengers
  validates_presence_of :departure
end