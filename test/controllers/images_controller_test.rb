require 'test_helper'
class ImagesControllerTest < ActionDispatch::IntegrationTest
  def test_show_success
    valid_image_url = 'https://www.gstatic.com/webp/gallery3/1.png'
    image = Image.create!(url: valid_image_url)
    get image_path(image)
    assert_response :ok
    assert_includes response.body, valid_image_url
    assert_equal Image.last.url, valid_image_url
  end

  def test_show_image_not_found
    get '/images/asdf'
    assert_includes response.body, 'No image found!'
  end

  def test_create
    valid_image_url = 'https://www.gstatic.com/webp/gallery3/1.png'
    assert_difference 'Image.count' do
      post images_path, params: { image: { url: valid_image_url } }
    end
    assert_equal 'Image url saved successfully', flash[:notice]
    assert_redirected_to image_path(Image.last)
  end

  def test_invalid_create
    invalid_image_url = 'asdf'
    assert_no_difference 'Image.count' do
      post images_path, params: { image: { url: invalid_image_url } }
    end
    assert_equal 'Invalid Url!', flash[:error]
    assert_redirected_to new_image_path
  end

  def test_new
    get new_image_path
    assert_response :ok
    assert_includes response.body, 'Image Link Form'
    assert_select '.btn-primary'
    assert_select '#Button123'
  end
end
