class Address
  include Mongoid::Document
  field :url, type: String
  field :user_id, type: Integer
end
