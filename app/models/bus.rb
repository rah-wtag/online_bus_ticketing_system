class Bus < ApplicationRecord
  validates :name, format: { with: /\A\S*\z/, message: 'no whitespace is allowed' }
  validates :name, uniqueness: { case_sensitive: false }
  validates :name, :typed, :brand, :capacity, presence: true

  validates :capacity, numericality: { greater_than: 0, less_than_or_equal_to: 45 }

  enum typed: { ac: 0, non_ac: 1 }
end
