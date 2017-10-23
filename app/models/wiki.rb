class Wiki < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  
  def collaborators
      Collaborator.where(wiki_id: id)
  end
  
  def users
      collaborators.users
  end
  
end
