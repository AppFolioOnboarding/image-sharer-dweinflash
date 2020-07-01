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

  def test_tag
    valid_image_url = 'https://www.gstatic.com/webp/gallery3/1.png'
    tag = 'tag1'
    image = Image.create!(url: valid_image_url, tag_list: tag)
    assert_equal image.tag_list, [tag]
  end

  def test_tags
    valid_image_url = 'https://www.gstatic.com/webp/gallery3/1.png'
    tags = 'tag1,tag2'
    image = Image.create!(url: valid_image_url, tag_list: tags)
    assert_equal image.tag_list, %w[tag1 tag2]
  end

  def test_empty_tag
    valid_image_url = 'https://www.gstatic.com/webp/gallery3/1.png'
    tag = ''
    image = Image.create!(url: valid_image_url, tag_list: tag)
    assert_equal image.tag_list, []
  end

  def test_no_tag
    valid_image_url = 'https://www.gstatic.com/webp/gallery3/1.png'
    image = Image.create!(url: valid_image_url, tag_list: nil)
    assert_equal image.tag_list, []
  end
end
