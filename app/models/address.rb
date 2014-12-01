require 'digest/sha1'

class Address
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user

  field :url, type: String
  field :short_path, type: String
  field :access_count, type: Integer, default: 0

  before_create :generate_short_path

  def short_url
    root_url = case Rails.env
      when 'production'
        'http://shortly.com/s/'
      else
        'http://localhost:3000/s/'
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
