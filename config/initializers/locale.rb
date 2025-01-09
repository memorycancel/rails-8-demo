# config/initializers/locale.rb
# 在查找任何翻译之前，必须指定加载路径。要从初始化程序而不是 config/application.rb 中更改默认本地化：

# Where the I18n library should search for translation files
I18n.load_path += Dir[Rails.root.join("lib", "locale", "*.{rb,yml}")]

# Permitted locales available for the application
I18n.available_locales = [:en, :zh]

# Set default locale to something other than :en
I18n.default_locale = :zh