class Membership < ApplicationRecord
  # scope macros

  # Concerns macros

  # Constants

  # Attributes related macros

  # association macros
  belongs_to :user, optional: true
  belongs_to :book

  # validation macros
  validate :nickname_or_user, :nickname_exist
  enum permission_group: [:owner, :member]

  # callbacks

  # other
  def name
    nickname || user.name
  end

  private
    # callback methods
    def nickname_or_user
      if self.nickname.blank? && self.user.blank?
        errors.add(%(Need either user or nickname))
      end
    end

    def nickname_exist
      if self.nickname.present? && self.book.user_memberships.exists?(nickname: self.nickname)
        errors.add(:nickname, %(Can't be duplicated))
      end
    end
end
