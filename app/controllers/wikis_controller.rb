class WikisController < ApplicationController
  def index
     @wikis = policy_scope(Wiki)
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end
  
  def create
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]
    @wiki.user_id = current_user.id
    @wiki.collaborator = User.find_by_email(params[:collaborator])
    @collaborator = Collaborator.new(user_id: @wiki.collaborator.id, wiki_id: @wiki.id)
    
    if @wiki.save
      
      flash[:notice] = "Wiki saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki."
      render :new
    end
  end
  
  def update 
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]
    @wiki.collaborator = User.find_by_email(params[:collaborator])
    @collaborator = Collaborator.new(user_id: @wiki.collaborator.id, wiki_id: @wiki.id)
    
    if @wiki.save
      flash[:notice] = "Wiki updated"
      redirect_to @wiki
    else
      flash.now[:alert] = "Error saving wiki."
      render :edit
    end
  end
  
  def destroy
     @wiki = Wiki.find(params[:id])
     
     if @wiki.destroy
       flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
       redirect_to wikis_path
     else
       flash.now[:alert] = "There was an error deleting the wiki."
       render :show
     end
  end
    
  def edit
    @wiki = Wiki.find(params[:id])
  end
end
