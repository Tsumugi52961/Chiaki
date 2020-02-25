# frozen_string_literal: true

json.array @bangumis do |bangumi|
  json.partial! '_bangumi', bangumi
end
