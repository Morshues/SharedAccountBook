class Book < ApplicationRecord
  # scope macros

  # Concerns macros

  # Constants

  # Attributes related macros

  # association macros
  has_many :user_memberships, class_name: 'Membership', dependent: :destroy
  has_many :members, through: :user_memberships, source: :user
  has_one :owner_membership, -> { where(permission_group: 0) }, class_name: 'Membership'
  has_one :owner, through: :owner_membership, source: :user
  has_many :items, dependent: :destroy
  has_many :exchanges, dependent: :destroy

  # validation macros
  validates_presence_of :name

  # callbacks
  before_create :init_token

  # other
  def self.gen_token
    loop do
      token = SecureRandom.urlsafe_base64

      return token unless Book.exists?(token: token)
    end
  end

  def init_token
    self.token = Book.gen_token
  end

  def total_price
    self.items.sum(:price)
  end

  private
    # callback methods
end
