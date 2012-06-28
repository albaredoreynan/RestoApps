class PurchaseItem < ActiveRecord::Base
  include Taxable
  
  attr_accessible :item_id, :purchase_id
  
  belongs_to :item
  belongs_to :purchase
  
  attr_accessor :unit_price
  
  def quantity
    @convert_unit ? qty.to(item.unit).value : self[:quantity]
  end

  def unit_cost
    (net_amount / quantity)
  end

  def subcategory_name
    item.subcategory_name
  end

  private
  def only_allow_unit_with_conversion_to_base_unit
    return if item.nil?
    unless available_units.map(&:id).reject(&:nil?).include?(unit_id)
      errors.add(:unit_id, 'does not have a conversion to base unit')
    end
  end
  
end
