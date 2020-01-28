# frozen_string_literal: true

# :nodoc:
module ApplicationHelper
  def new_record_path(record_name)
    public_send "new_#{record_name}_path"
  end
end
