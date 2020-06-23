require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  def test_valid_image
    @image = Image.new(url: 'https://www.gstatic.com/webp/gallery3/1.png')
    assert_predicate @image, :valid?
  end

  def test_invalid_image
    @image = Image.new(url: 'asdf')
    assert_predicate @image, :invalid?
  end

  def test_empty_url
    @image = Image.new(url: '')
    assert_predicate @image, :invalid?
  end

  def test_seeds
    Image.delete_all
    Rails.application.load_seed
    assert_equal Image.count, 10
  end
end
