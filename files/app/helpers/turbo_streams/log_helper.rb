module TurboStreams::LogHelper
  def log(message)
    turbo_stream_action_tag :log, message: message
  end
end

Turbo::Streams::TagBuilder.prepend(TurboStreams::LogHelper)
