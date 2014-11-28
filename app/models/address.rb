require 'digest/sha1'

class Address
  include Mongoid::Document
  belongs_to :user

  field :url, type: String
  field :short_path, type: String

  before_create :generate_short_path

  private

    def generate_short_path
      secret = 'youpi'
      digest = Digest::SHA1.hexdigest(secret + self.url) 
      self.short_path = digest[0..5] 
    end
end
