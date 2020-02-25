# frozen_string_literal: true

json.bangumi do
  json.partial! '_bangumi.json.jbuilder', bangumi: @bangumi
end
