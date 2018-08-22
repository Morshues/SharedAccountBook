class Book < ApplicationRecord
  # scope macros

  # Concerns macros

  # Constants

  # Attributes related macros

  # association macros
  belongs_to :user, :class_name => "User", :foreign_key => "owner_id"

  # validation macros

  # callbacks

  # other

  private
    # callback methods
end
