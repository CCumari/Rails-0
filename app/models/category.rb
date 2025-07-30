class Category < ApplicationRecord
  has_many :articles

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name

  def to_s
    name.capitalize
  end
end