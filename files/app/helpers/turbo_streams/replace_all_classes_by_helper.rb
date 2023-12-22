module TurboStreams::ReplaceAllClassesByHelper
  def replace_all_classes_by(selector, new_classes)
    turbo_stream_action_tag :replace_all_classes_by, selector: selector, new_classes: new_classes
  end
end

Turbo::Streams::TagBuilder.prepend(TurboStreams::ReplaceAllClassesByHelper)
