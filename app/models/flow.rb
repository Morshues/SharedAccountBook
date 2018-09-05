class Flow < ApplicationRecord
  # scope macros

  # Concerns macros

  # Constants

  # Attributes related macros

  # association macros
  belongs_to :membership, optional: true
  belongs_to :item

  # validation macros

  # callbacks

  # other

  private
    # callback methods
end
