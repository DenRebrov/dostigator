class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # настройка для работы девайза при правке профиля юзера
  before_action :configure_permitted_parameters, if: :devise_controller?

  # хелпер метод, доступный во вьюхах
  helper_method :current_user_can_edit?

  helper_method :current_user_for_message

  # Вспомогательный метод, возвращает true, если текущий залогиненный юзер
  # может править указанную модель. Обновили метод — теперь на вход принимаем
  # target, или «дочерние» объекты
  def current_user_can_edit?(model)
    # Если у модели есть юзер и он залогиненный, пробуем у модели взять .target и
    # если он есть, проверяем его юзера на равенство current_user.
    user_signed_in? && (model.user == current_user ||
        (model.try(:target).present? && model.target.user == current_user)
    )
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:password, :password_confirmation, :current_password])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :birthday, :ava])
  end

  private

  def current_user_for_message
    @current_user_for_message ||= User.where(id: cookies.signed[:user_id].first)

    if @current_user_for_message.nil?
      @current_user_for_message = User.create
      cookies.signed[:user_id] = @current_user_for_message.id
    end
  end
end