class Book < ApplicationRecord
  # scope macros

  # Concerns macros

  # Constants

  # Attributes related macros

  # association macros
  belongs_to :user, :class_name => "User", :foreign_key => "owner_id"

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

  private
    # callback methods
end
