class Product < ApplicationRecord
  validates :name, :sku, :price, :stock_quantity, presence: true
  validates :sku, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: INTEGER_DEFAULT, less_than_or_equal_to: DECIMAL_MAX }
  validates :name,:sku, length: { minimum: STRING_MIN, maximum: STRING_MAX }
  validates :stock_quantity, numericality: { only_integer: true, greater_than_or_equal_to: INTEGER_DEFAULT, less_than_or_equal_to: FIXNUM_MAX }
end