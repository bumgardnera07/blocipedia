class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
          :recoverable, :rememberable, :trackable, :validatable, :confirmable
          
  after_initialize { self.role ||= :standard }
  enum role: [:standard, :admin, :premium]
  
   has_many :wikis
   
  def publish_wikis(wikis)
      wikis.each do |f|
          f.update_attributes(:private => nil)
      end
  end
end
