class StepsController < ApplicationController
  before_action :set_target, only: [:new, :edit, :update, :create, :destroy]

  before_action :set_step, only: [:edit, :update, :destroy]

  def new
    @step = @target.steps.build
  end

  def edit; end
  
  def create
    @step = @target.steps.build(step_params)
    #@new_step = @target.steps.build(step_params)
    #@new_step.user = current_user

    if @step.save
      # если сохранился успешно, редирект на страницу самого события
      redirect_to edit_target_path(@target), notice: I18n.t('controllers.steps.created')
    else
      # если ошибки — рендерим здесь же шаблон события
      #flash.now[:alert] = "Не удалось сохранить шаг"
      render 'edit', alert: I18n.t('controllers.steps.error')
    end
  end

  def update
    if @step.update(step_params)
      redirect_to edit_target_path(@target), notice: I18n.t('controllers.steps.updated')
    else
      render :edit
    end
  end

  def destroy
    @step.destroy
    redirect_to edit_target_path(@target), notice: I18n.t('controllers.steps.destroyed')
  end

  private

  def set_target
    @target = Target.find(params[:target_id])
  end

  def set_step
    @step = @target.steps.find(params[:id])
  end

  def step_params
    params.require(:step).permit(:name, :status)
  end
end
