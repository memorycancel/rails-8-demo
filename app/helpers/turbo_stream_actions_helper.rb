module TurboStreamActionsHelper
  def redirect_to(url)
    turbo_stream_action_tag :redirect_to, url: url
  end
end

Turbo::Streams::TagBuilder.prepend(TurboStreamActionsHelper)