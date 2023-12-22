module TurboStreams::FocusHelper
  def focus(selector)
    turbo_stream_action_tag :focus, selector: selector
  end
end

Turbo::Streams::TagBuilder.prepend(TurboStreams::FocusHelper)
