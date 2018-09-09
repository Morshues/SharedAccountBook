class Item < ApplicationRecord
  # scope macros

  # Concerns macros

  # Constants

  # Attributes related macros

  # association macros
  belongs_to :book
  has_many :flows, dependent: :destroy
  accepts_nested_attributes_for :flows, allow_destroy: true, reject_if: :blank_flow?
  belongs_to :exchange, optional: true
  
  # validation macros

  # callbacks

  # other
  def currency
    self.exchange&.currency || self.book.currency_name
  end

  private
    # callback methods
    def blank_flow?(att)
      att['number'].nil? || att['number'] == 0
    end
end
