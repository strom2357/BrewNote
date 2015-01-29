class User < ActiveRecord::Base
	attr_reader :password

	after_initialize :ensure_session_token

	validates :name, :password_digest, :session_token, presence: true
	validates :password, length: { minimum: 3, allow_nil: true }
	validates :session_token, :name, uniqueness: true

	def self.find_by_credentials(name, password)
		user = User.find_by(name: name)
		user.try(:is_password?, password) ? user : nil
	end

	def self.generate_session_token
		SecureRandom::urlsafe_base64(16)
	end

	def is_password?(unencryped_password)
		BCrypt::Password.new(self.password_digest).is_password?(unencryped_password)
	end

	def password=(unencryped_password)
		if unencryped_password.present?
			@password = unencryped_password
			self.password_digest = BCrypt::Password.create(unencryped_password)
		end
	end

	def reset_session_token!
		self.session_token = self.class.generate_session_token
		self.save!
		self.session_token
	end

	private

	def ensure_session_token
		self.session_token ||= self.class.generate_session_token
	end
end
