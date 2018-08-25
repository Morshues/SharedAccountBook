class Membership < ApplicationRecord
  # scope macros

  # Concerns macros

  # Constants

  # Attributes related macros

  # association macros
  belongs_to :user
  belongs_to :book

  # validation macros
  enum permission_group: [:owner, :member]

  # callbacks

  # other

  private
    # callback methods
end
