class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #before_save :generate_authentication_token

  def generate_authentication_token
    if self.auth_token != "0"
      return false
    else
      self.auth_token = genUnique
      self.save
    end
  end
  def remove_authentication_token
    self.auth_token = "0"
    self.save
  end

  def genUnique
    loop do
      token = SecureRandom.hex(32)
      break token unless User.where(auth_token: token).exists?
    end
  end

  def setSessionTime
    self.last_login = Time.now
    self.save
    puts "Hahahahahahah"
    puts self.last_login
  end

  def setTotalTime
    if self.last_login
      ttime = Time.now - self.last_login
      if self.total_time.nil?
        self.total_time = ttime
      else
        self.total_time = self.total_time + ttime
      end
      self.last_login = nil
      self.save
    end
  end
end
