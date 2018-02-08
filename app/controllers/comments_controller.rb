class CommentsController < ApplicationController
  # встроенный в девайз фильтр - посылает незалогиненного пользователя
  before_action :authenticate_user!, except: [:show, :index]

  before_action :set_target, only: [:create, :destroy]

  before_action :set_comment, only: [:destroy]

  def create
    @new_comment = @target.comments.build(comment_params)
    @new_comment.user = current_user

    if @new_comment.save
      # уведомляем всех подписчиков о новом комментарии
      #notify_subscribers(@target, @new_comment)

      # если сохранился успешно, редирект на страницу самого события
      redirect_to @target, notice: I18n.t('controllers.comments.created')
    else
      # если ошибки — рендерим здесь же шаблон события
      redirect_to @target, alert: I18n.t('controllers.comments.error')
    end
  end

  def destroy
    message = {notice: I18n.t('controllers.comments.destroyed')}

    # удалять комментарии может только пользователь, который их создал
    if current_user_can_edit?(@comment)
      @comment.destroy!
    else
      message = {alert: I18n.t('controllers.comments.error')}
    end

    redirect_to @target, message
  end

  private

  def set_target
    @target = Target.find(params[:target_id])
  end

  def set_comment
    @comment = @target.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_name)
  end
end
