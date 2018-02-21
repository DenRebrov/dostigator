class TargetsController < ApplicationController
  # встроенный в девайз фильтр - посылает незалогиненного пользователя
  before_action :authenticate_user!, except: [:show, :index]

  # задаем объект @target для экшена show
  before_action :set_target, only: [:show]

  # задаем объект @target от текущего юзера
  before_action :set_current_user_target, only: [:edit, :update, :destroy]

  def index
    @targets = Target.all

    @user = User.find_by(params[:target])
  end

  def show
    @commentable = @target
    @comments = @commentable.comments
    @comment = Comment.new

    @user = @target.user

    @new_step = @target.steps.build(params[:step])
  end

  def new
    @target = current_user.targets.build
    @step = @target.steps.build
  end

  def create
    @target = current_user.targets.build(target_params)

    if @target.save
      redirect_to current_user, notice: I18n.t('controllers.targets.created')
    else
      build_steps

      render :new
    end
  end

  def edit
    build_steps
    @steps = @target.steps
  end

  def update
    if @target.update(target_params)
      redirect_to @target, notice: I18n.t('controllers.targets.updated')
    else
      build_steps

      render :edit
    end
  end

  def destroy
    @target.destroy
    redirect_to current_user, notice: I18n.t('controllers.targets.destroyed')
  end

  private

  def build_steps
    @target.steps.build if @target.steps.empty?
  end

  def set_target
    @target = Target.find(params[:id])
  end

  def set_current_user_target
    @target = current_user.targets.find(params[:id])
  end

  def target_params
    params.require(:target).permit(:title, :description, :date, :status, steps_attributes: [:id, :name, :status])
  end
end
