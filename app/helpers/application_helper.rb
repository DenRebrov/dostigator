module ApplicationHelper
  # Возвращает путь к аватарке данного юзера
  def user_avatar(user)
    if user.ava? #&& user
      user.ava.url
    else
      asset_path('ava.png')
    end
  end
end
