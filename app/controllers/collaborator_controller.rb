class CollaboratorController < ApplicationController
   def update
    @user = User.find(params[:id])
    @user.standard!
    @wiki =current_user.wikis
    flash[:success] = "NO REFUNDS!"
   end
end
