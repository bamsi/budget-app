class Category < ApplicationRecord
  belongs_to :user
  has_many :expenditures

  validates :name, presence: true, length: { maximum: 250 }
  validates :icon, presence: true
end
