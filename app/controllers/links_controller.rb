class LinksController <ApplicationController
  
  def index
    if(!current_user)
      redirect_to login_path
    else 
      @links = Link.where(user_id: current_user.id)
    end
  end
  
  def new
    @link = Link.new
  end
  
  def create
    @link = current_user.links.new(link_params)
    if @link.save
      flash[:success] = "Link added."
      redirect_to links_path
    else
      flash[:danger] = @link.errors.full_messages.join(", ")
      redirect_to links_path
    end
  end
  
  private
  
    def link_params
      params.require(:link).permit(:url, :title)
    end
end