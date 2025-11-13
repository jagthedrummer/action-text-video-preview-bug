# frozen_string_literal: true

require "active_support/core_ext/object/try"
module ActionText
  module Attachments
    module TrixConversion
      def to_trix_attachment(content = trix_attachment_content)
        attributes = full_attributes.dup
        attributes["content"] = content if content
        attributes["url"] = trix_attachable_url if previewable_attachable? && previewable?
        TrixAttachment.from_attributes(attributes)
      end

      def trix_attachable_url
        Rails.application.routes.url_helpers.rails_blob_url(preview_image.blob, only_path: true)
      end
    end
  end
end
