class Membership < ApplicationRecord
  # scope macros

  # Concerns macros

  # Constants

  # Attributes related macros

  # association macros
  belongs_to :user, optional: true
  belongs_to :book

  # validation macros
  validate :nickname_exist
  enum permission_group: [:owner, :member]

  # callbacks

  # other

  private
    # callback methods
    def nickname_exist
      if self.book.user_memberships.exists?(nickname: self.nickname)
        errors.add(:nickname, %(Can't be duplicated))
      end
    end
end
