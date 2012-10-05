class Admin < ActiveRecord::Base
  attr_accessible :email, :name, :password, :role_id
  belongs_to :role
  
  
  def self.authenticate?(name)
    u = Admin.find_by_name(name)
    #u = Admin.find_by_password password
    #u.hashed_password == Digest::SHA1.hexdigest(u.salt + password)
  end
end
