class User < ApplicationRecord
  # scope macros

  # Concerns macros

  # Constants

  # Attributes related macros
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  # association macros
  has_many :book_memberships, :class_name => "Membership", dependent: :destroy
  has_many :books, :through => :book_memberships, source: :book

  # validation macros

  # callbacks

  # other
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name  
      user.image = auth.info.image 
    end

  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.search(word, count = 5)
    query = "%#{word}%"
    mail_query = "%#{word}%@%"
    self.where('name ILIKE ? OR email ILIKE ?', query, mail_query).take(count)
  end

  private
    # callback methods
end
