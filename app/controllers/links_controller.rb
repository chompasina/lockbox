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
  
  def edit
    @link = Link.find(params[:id])
  end
  
  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      flash[:success] = "Link has been updated"
      redirect_to links_path
    else 
      flash.now[:warning] = @link.errors.full_messages.join(", ")
      render :edit
    end
  end
  
  def show
    @link = Link.find(params[:id])
  end
  
  private
  
    def link_params
      params.require(:link).permit(:url, :title, :tag_list)
    end
end