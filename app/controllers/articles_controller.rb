class ArticlesController < ApplicationController
  before_action :signed_in_user, except: [:index, :show, :qna]
  before_action :owner_or_admin, only: [:edit, :update, :destroy]
  before_action :admin_user, only: [:answer]
  
  def qna
    @questions = Article.where({types: 0, order_id: nil}) # 0: 질문답변
  end
  
  def answer
    @article = Article.find(params[:id])
    @article.answered = true
    render 'edit'
  end

  def new
    @article = Article.new(types: params[:type], order_id: params[:order_id])
  end

  def create
    @article = current_user.articles.build(article_params)
#    @data = @article
#    render 'test/test'

    if @article.save
      flash[:success] = "Created!"
      redirect_back_or '/qna'
    else
      flash.now[:success] = "Failed.."
      render 'new'
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    
    if @article.update_attributes(article_params)
      flash[:success] = '수정 완료 되었습니다.'
      redirect_back_or '/qna'
    else
      render 'edit'
    end
  end
  
  def destroy
    Article.find(params[:id]).destroy
    flash[:success] = "Question deleted.."
    redirect_back_or '/qna'
  end
  
  private
    def article_params
      article_params = params.require(:article).permit(
        :types, :title, :content, :answered, :order_id)
    end
    
    def owner_or_admin
      unless owner? || current_user.admin?
        flash[:warning] = "직접 신청한 주문서 이외는 볼수 없습니다"
        redirect_to(root_url)
      end
    end
  
    def owner?
      @article = Article.find(params[:id])
      current_user?(User.find_by(id: @article.user_id))
    end
  
end