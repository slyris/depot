class Product < ActiveRecord::Base
  validates_presence_of :title, :description
  validates_numericality_of :price
  validate :price_must_be_a_buck

protected
  def price_must_be_a_buck
    errors.add(:price, 'should be > $1') \
      if price.nil? || price < 1.00
  end
end
