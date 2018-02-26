source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'

# гем, предоставляющий возможности для аутентификации в rails-приложениях
gem 'devise'

# гем для перевода сообщений девайса
gem 'devise-i18n'

# гем для с русскми форматами (времени и пр.)
gem 'russian'

# гем, интегрирующий bootstrap
gem 'twitter-bootstrap-rails'

# Use Puma as the app server
gem 'puma', '~> 3.7'

# Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0'

# гем для поддержки jquery
gem 'jquery-rails'

# гем для загрузки картинок
gem 'carrierwave'

# гем для обработки картинок
gem 'rmagick'

# гем для работы carrierwave с хранилищем Amazon S3
gem 'fog-aws'

# гем для работы с вложенными формами
gem 'cocoon'

gem 'turbolinks'

group :production do
  # в продакшен сервере heroku этот гем соединяет с базой данных Postgres
  gem 'pg'
end

group :development, :test do
  gem 'listen'

  # Гем для работы c sqlite3
  gem 'sqlite3'

  # Гем для дебага
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
