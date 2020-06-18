class ImagesController < ActionController::Base
  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(url: image_params[:url])
    if @image.valid?
      @image.save!
      flash[:notice] = "Image url saved successfully"
      redirect_to @image
    else
      flash[:error] = 'Invalid Url!'
      redirect_to new_image_path
    end
  end

  private

  def image_params
    params.require(:image).permit(:url)
  end
end
