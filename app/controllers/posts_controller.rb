class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  

  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 5)
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    if user_signed_in? and current_user.has_role?(:admin)
      @post =Post.new(post_params)
      #일단 post를 생성하고 post.rb에서 확인을 통해 save시켜줌
      if @post.save
        redirect_to @post      
      else
        redirect_to :back
        #실패하면 뒤로 돌려버림
      end
    else
      redirect_to :back
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post      
    else
      redirect_to :back
      #실패하면 뒤로 돌려버림
    end
  end

  def destroy
    if  @post.destroy
      redirect_to :posts
      #index로 보내줌
      
    else 
      redirect_to :back
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :content)
    #이 post를 가지고있으면서 title과 content를 허용한다.
    
    # params[:title]+params[:content] but :post와 같은 뜻
  end
  
  def find_post
    @post = Post.find(params[:id])
  end
  
end

