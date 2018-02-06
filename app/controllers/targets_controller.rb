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
  end

  def new
    @target = current_user.targets.build
  end

  def edit
  end

  def create
    @target = current_user.targets.build(target_params)

    if @target.save
      redirect_to @target, notice: 'Цель определена!'
    else
      render :new
    end
  end

  def update
    if @target.update(target_params)
      redirect_to @target, notice: 'Цель изменена'
    else
      render :edit
    end
  end

  def destroy
    @target.destroy
    redirect_to targets_url, notice: 'Цель была удалена'
  end

  private

  def set_target
    @target = Target.find(params[:id])
  end

  def set_current_user_target
    @target = current_user.targets.find(params[:id])
  end

  def target_params
    params.require(:target).permit(:title, :description, :date)
  end
end
