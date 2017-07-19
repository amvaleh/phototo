class Photo < ApplicationRecord
  mount_uploaders :avatars, AvatarUploader
  serialize :avatars, JSON
  
  after_create :create_pass



  def create_pass
    begin
      p = "kadro" + SecureRandom.hex(2)
      self.pass = p # or whatever you chose like UUID tools
      self.save
      break
    end while self.class.exists?(:pass => p)
  end


end
