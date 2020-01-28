# frozen_string_literal: true

# :nodoc:
module IdentitiesHelper
  def avatar_name(identity)
    if identity.avatar.attached?
      identity.avatar.filename
    else
      'No file chosen'
    end
  end
end
