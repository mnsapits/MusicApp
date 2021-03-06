# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
    validates :email, uniqueness: true
    validates :email, :password_digest, :session_token, presence: true
    validates :password, length: {minimum: 6, allow_nil: true}

    after_initialize :ensure_session_token

    attr_reader :password


    def password=(password)
      @password = password
      self.password_digest = BCrypt::Password.create(password)
    end


    def is_password?(password)
      bc_object = BCrypt::Password.new(self.password_digest)
      bc_object.is_password?(password)
    end

    def reset_session_token!
      self.session_token = User.generate_session_token
      self.save!
      self.session_token
    end

    def self.find_by_credentials(email, password)
      possible_user = User.find_by(email: email)
      return nil unless possible_user
      possible_user.is_password?(password) ? possible_user : nil
    end

    private
    def ensure_session_token
      self.session_token ||= User.generate_session_token
    end

    def self.generate_session_token
      SecureRandom.urlsafe_base64
    end
end
