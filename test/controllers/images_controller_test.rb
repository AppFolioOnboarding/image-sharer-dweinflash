require 'test_helper'

VALID_IMAGE_URL = 'https://www.gstatic.com/webp/gallery3/1.png'.freeze

class ImagesControllerTest < ActionDispatch::IntegrationTest
  def test_filter_many_tags
    tag_1 = 'tag1'
    tag_many = %w[tag1 tag2]
    Image.create!(url: VALID_IMAGE_URL, tag_list: tag_many)
    get "/images/?tag=#{tag_1}"
    assert_select '.js-image-card', 1
  end

  def test_filter_different_tags
    tag_1 = 'tag1'
    tag_2 = 'tag2'
    Image.create!(url: VALID_IMAGE_URL, tag_list: tag_1)
    get "/images/?tag=#{tag_1}"
    assert_select '.js-image-card', 1
    Image.create!(url: VALID_IMAGE_URL, tag_list: tag_2)
    get "/images/?tag=#{tag_2}"
    assert_select '.js-image-card', 1
  end

  def test_filter_same_tags
    tag = 'test'
    Image.create!(url: VALID_IMAGE_URL, tag_list: tag)
    get "/images/?tag=#{tag}"
    assert_select '.js-image-card', 1
    Image.create!(url: VALID_IMAGE_URL, tag_list: tag)
    get "/images/?tag=#{tag}"
    assert_select '.js-image-card', 2
  end

  def test_filter_no_tag_match
    tag_many = %w[tag1 tag2]
    Image.create!(url: VALID_IMAGE_URL, tag_list: tag_many)
    get images_url(tag: 'tag3')
    assert_select '.js-image-card', count: 0
  end

  def test_filter_empty_tag
    empty_tag = []
    other_tag = 'other'
    Image.create!(url: VALID_IMAGE_URL, tag_list: empty_tag)
    Image.create!(url: VALID_IMAGE_URL, tag_list: other_tag)
    get images_url(tag: empty_tag)
    assert_select '.js-image-card', 2
  end

  def test_index
    images = [
      { url: 'https://www.gstatic.com/webp/gallery3/1.png',
        tag_list: 'tag1' },
      { url: 'https://www.gstatic.com/webp/gallery3/2.png',
        tag_list: 'tag2' }
    ]
    Image.create!(images)
    get images_path
    assert_response :ok
    assert_select 'img', 2 do |image|
      assert image[0].attributes['width'].value.to_i <= 400
      assert image[1].attributes['width'].value.to_i <= 400
      assert_equal 'https://www.gstatic.com/webp/gallery3/2.png',
                   image[0].attributes['src'].value
      assert_equal 'https://www.gstatic.com/webp/gallery3/1.png',
                   image[1].attributes['src'].value
    end
    assert_select 'tr', 2
    assert_select 'td', 'tag2'
    assert_select 'td', 'tag1'
  end

  def test_show_success
    valid_tag = 'test'
    image = Image.create!(url: VALID_IMAGE_URL, tag_list: valid_tag)
    get image_path(image)
    assert_response :ok
    assert_includes response.body, VALID_IMAGE_URL
    assert_equal Image.last.url, VALID_IMAGE_URL
    assert_equal Image.last.tag_list, [valid_tag]
    assert_select '.js-image-tag', valid_tag
  end

  def test_show_empty_tag
    valid_tag = ''
    image = Image.create!(url: VALID_IMAGE_URL, tag_list: valid_tag)
    get image_path(image)
    assert_response :ok
    assert_includes response.body, VALID_IMAGE_URL
    assert_equal Image.last.url, VALID_IMAGE_URL
    assert_equal Image.last.tag_list, []
    assert_select '.js-image-tag', valid_tag
  end

  def test_show_no_tag
    image = Image.create!(url: VALID_IMAGE_URL, tag_list: nil)
    get image_path(image)
    assert_response :ok
    assert_includes response.body, VALID_IMAGE_URL
    assert_equal Image.last.url, VALID_IMAGE_URL
    assert_equal Image.last.tag_list, []
    assert_select '.js-image-tag', nil
  end

  def test_show_many_tags
    valid_tags = %w[test1 test2]
    image = Image.create!(url: VALID_IMAGE_URL, tag_list: valid_tags)
    get image_path(image)
    assert_response :ok
    assert_select '.js-image-tag', valid_tags.join(', ')
  end

  def test_show_image_not_found
    get '/images/asdf'
    assert_includes response.body, 'No image found!'
  end

  def test_create
    assert_difference 'Image.count' do
      post images_path, params: { image: { url: VALID_IMAGE_URL } }
    end
    assert_equal 'Image url saved successfully', flash[:notice]
    assert_redirected_to image_path(Image.last)
  end

  def test_invalid_create
    inVALID_IMAGE_URL = 'asdf'
    assert_no_difference 'Image.count' do
      post images_path, params: { image: { url: inVALID_IMAGE_URL } }
    end
    assert_equal 'Invalid Url!', flash[:error]
    assert_redirected_to new_image_path
  end

  def test_new
    get new_image_path
    assert_response :ok
    assert_includes response.body, 'Image Link Form'
    assert_select '.btn-primary'
    assert_select '#button_123'
    assert_select '#image_tag_list'
    assert_select '#image_tag_label'
  end
end
