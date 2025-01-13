class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  around_action :switch_locale


  # 现在，每个依赖于 url_for 的辅助方法（例如，命名路由的辅助方法，
  # 如 root_path 或 root_url ；资源路由的辅助方法，如 books_path 或 books_url 等）
  # 都会在查询字符串中自动包含本地语言，就像下面这样： http://localhost:3001/?locale=ja .
  def default_url_options
    { locale: I18n.locale }
  end

  # 国际化应用程序可能需要支持多种国家地区语言。为此，应在每次请求开始时设置本地语言，
  # 以便在该请求的生命周期内使用所需的本地语言翻译所有字符串。
  # 除非使用了 I18n.locale= 或 I18n.with_locale ，否则所有翻译都将使用默认的语言。
  # 如果不在每个控制器(controller)中一致设置 I18n.locale ，它可能会泄漏到同一线程/进程服务的后续请求中。
  # 例如，在一个 POST 请求中执行 I18n.locale = :es 会影响到以后所有未设置 locale 的控制器请求，
  # 但仅限于该特定线程/进程。因此，你可以使用 `I18n.with_locale` 代替 `~~I18n.locale =~~` ，这样就不会出现泄漏问题。
  def switch_locale(&action)
    locale = params[:locale] ||
              I18n.default_locale ||
              extract_locale_from_tld ||
              extract_locale_from_subdomain ||
              extract_locale_from_accept_language_header
    I18n.with_locale(locale, &action)
  end

  # 使用主域名推断语言
  # Get locale from top-level domain or return +nil+ if such locale is not available
  # You have to put something like:
  #   127.0.0.1 application.com
  #   127.0.0.1 application.it
  #   127.0.0.1 application.pl
  # in your /etc/hosts file to try this out locally
  def extract_locale_from_tld
    parsed_locale = request.host.split(".").last
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  # 使用子域名推断语言
  # Get locale code from request subdomain (like http://it.application.local:3000)
  # You have to put something like:
  #   127.0.0.1 it.application.local
  # in your /etc/hosts file to try this out locally
  #
  # Additionally, you need to add the following configuration to your config/environments/development.rb:
  #   config.hosts << 'it.application.local:3000'
  def extract_locale_from_subdomain
    parsed_locale = request.subdomains.first
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  # Accept-Language HTTP 标头表示请求响应的首选语言。浏览器会根据用户的语言偏好设置来设置该标头值，因此它是推断地域的首选。
  def extract_locale_from_accept_language_header
    request.env["HTTP_ACCEPT_LANGUAGE"].scan(/^[a-z]{2}/).first
  end
end
