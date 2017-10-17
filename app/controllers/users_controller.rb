class UsersController < ApplicationController
   def update
    @user = User.find(params[:id])
    @user.standard!
    @wiki =current_user.wikis
    @user.publish_wikis(@wiki)
    redirect_to root_path
    flash[:success] = "NO REFUNDS!"
   end
   
end
