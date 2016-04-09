class User < ActiveRecord::Base

    has_many :projects, :dependent => :destroy
    has_many :donations, :dependent => :destroy

    validates_presence_of :full_name, :email, :country, :state, :city, :address, :password_digest
    validates_length_of :state, is: 2
    validates_format_of :email, with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
    validates_length_of :full_name, minimum: 3
    validates_uniqueness_of :email

    has_secure_password

    before_create :generate_token

    scope :confirmed, -> { where('confirmed_at IS NOT NULL') }

    def generate_token
        self.confirmation_token = SecureRandom.urlsafe_base64
    end

    def confirm!
        return if confirmed?
        self.confirmed_at = Time.current
        self.confirmation_token = ''
        save!
    end

    def confirmed?
        confirmed_at.present?
    end

    def self.authenticate(email, password)
		user = confirmed.
						find_by(email: email).
						try(:authenticate, password)
	end

    def is_teacher
        self.user_type == '1'
    end

end
