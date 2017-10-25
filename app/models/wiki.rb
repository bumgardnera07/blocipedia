class Wiki < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  
  has_many :collaborators
  has_many :users, through: :collaborators
  
  def add_collaborator(currentwiki, useremail)
    Collaborator.new(user: (User.find_by email: useremail), wiki: currentwiki)
  end
end
