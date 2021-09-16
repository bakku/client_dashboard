# frozen_string_literal: true

module ApplicationHelper
  FLASH_TRANSLATION = {
    notice: "info",
    success: "success",
    error: "error",
    alert: "error"
  }.freeze

  def flash_class(level)
    "alert alert-#{FLASH_TRANSLATION.fetch(level)}"
  end
end
