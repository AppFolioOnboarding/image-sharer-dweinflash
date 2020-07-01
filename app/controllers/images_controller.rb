class ImagesController < ApplicationController
  def index
    image_tags = params.permit(:tag)[:tag]
    @images = if image_tags.present?
                Image.tagged_with(image_tags).order(created_at: :desc)
              else
                Image.all.order(created_at: :desc)
              end
  end

  def show
    @image = Image.find_by(id: params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.valid?
      @image.save!
      flash[:notice] = 'Image url saved successfully'
      redirect_to @image
    else
      flash[:error] = 'Invalid Url!'
      redirect_to new_image_path
    end
  end

  def destroy
    @image = Image.find_by(id: params[:id])
    if @image
      @image.destroy
    else
      flash[:error] = 'Cannot delete image - it does not exist!'
    end
    redirect_to images_path
  end

  private

  def image_params
    params.require(:image).permit(:url, :tag_list)
  end
end
