class CommentsController < ApplicationController
  # встроенный в девайз фильтр - посылает незалогиненного пользователя
  before_action :authenticate_user!, except: [:create, :destroy]

  before_action :set_commentable, only: [:create, :destroy]

  before_action :set_comment, only: [:destroy]

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @commentable, notice: I18n.t('controllers.comments.created')
    else
      redirect_to @commentable, alert: I18n.t('controllers.comments.error')
    end
  end

  def destroy
    message = {notice: I18n.t('controllers.comments.destroyed')}

    # удалять комментарии может только пользователь, который их создал
    if current_user_can_edit?(@comment) || current_user
      @comment.destroy!
    else
      message = {alert: I18n.t('controllers.comments.error')}
    end

    redirect_to @commentable, message
  end

  private

  def set_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  def set_comment
    @comment = @commentable.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end
end
