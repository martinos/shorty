require 'test_helper'

describe Address do
  it 'should save short url on creation' do
    addr = Address.create(url: 'http://example.com')
    addr.reload.short_path.wont_be_nil
  end
end

