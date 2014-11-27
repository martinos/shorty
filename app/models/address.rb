class Address
  include Mongoid::Document
  belongs_to :user

  field :url, type: String
end
