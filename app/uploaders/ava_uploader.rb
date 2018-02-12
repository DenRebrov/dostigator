class AvaUploader < CarrierWave::Uploader::Base

  # Добавляем обработчик, чтобы можно было менять размер автарок
  # и делать миниатюрные версии
  include CarrierWave::RMagick

  # Если мы работаем в локальной версии нашего приложения,
  # аватарки хранятся прямо в файловой системе, иначе используем fog
  # для загрузки их на Amazon S3
  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  # Папка, в которой будут храниться все наши загруженные файлы
  # например, uploads/avatar/avatat/1
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Аватарку, загруженную пользователем, надо обрезать/уменьшить
  # так, чтобы получился квадрат 300x300

  process resize_to_fill: [300, 300]

  # А потом нужно сделать миниатюрную версию 100x100

  version :thumb do
    process resize_to_fit: [100, 100]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
