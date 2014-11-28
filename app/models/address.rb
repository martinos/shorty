require 'digest/sha1'

class Address
  include Mongoid::Document
  belongs_to :user

  field :url, type: String
  field :short_path, type: String

  before_create :generate_short_path

  def short_url
    root_url = case Rails.env
      when 'production'
        'http://shortly.com/'
      else
        'http://localhost:3000/'
      end
    root_url + self.short_path
  end

  private

    def generate_short_path
      secret = 'youpi'
      digest = Digest::SHA1.hexdigest(secret + self.url) 
      self.short_path = digest[0..5] 
    end
end
