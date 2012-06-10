require 'digest'
class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :email, :nom, :password, :password_confirmation
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :nom, :presence => true,
                  :length   => { :maximum => 50 }
  validates :email, :presence => true,
                    :format   => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
                   # Crée automatique l'attribut virtuel 'password_confirmation'.
  validates :password, :presence     => true,
                       :confirmation => true,
                       :length       => { :within => 6..40 }

   before_save :encrypt_password

  # Retour true (vrai) si le mot de passe correspond.
  def has_password?(password_soumis)
    encrypted_password == encrypt(password_soumis)
  end

  def self.authenticate(email, password_soumis)
    user = User.find_by_email (email)
    return nil  if user.nil?
    return user if user.has_password?(password_soumis)
    nil

  end

   
  private

     def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password) 
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end

end
