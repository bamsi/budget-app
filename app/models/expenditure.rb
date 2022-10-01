class Expenditure < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category

  validates :name, presence: true, length: { maximum: 250 }
  validates :amount, numericality: { greater_than: 0 }
  validates :category_id, presence: true
end
