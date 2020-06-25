class ImagesController < ActionController::Base
  def index
    @images = Image.all.order(created_at: :desc)
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

  private

  def image_params
    params.require(:image).permit(:url, :tag_list)
  end
end
