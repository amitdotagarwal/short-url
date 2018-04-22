class UrlsController < ApplicationController
  before_action :find_url, only: [:show, :shortened]
  impressionist :actions=>[:shortened]
  # GET /urls
  # GET /urls.json
  def new
    @url = Url.new
  end

  # GET /urls/1
  # GET /urls/1.json
  def show
    puts @url.inspect
  end
  
  def shortened
    redirect_to @url.sanitized_url
    #@url.update_attribute{:count => '1'}
  end

  # POST /urls
  # POST /urls.json
  def create
    @url = Url.new(url_params)
    @url.sanitize
    @url.current_ip = request.remote_ip
    if @url.new_url?
      respond_to do |format|
        if @url.save
          format.html { redirect_to shortened_path(@url.short_url), notice: 'Url was successfully created.' }
          format.json { render :show, status: :created, location: @url }
        else
          format.html { render :new }
          format.json { render json: @url.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:notice] = "A short link for this URL is already in our database"
      redirect_to shortened_path(@url.find_duplicate.short_url)
    end
    
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def find_url
      @url = Url.find_by_short_url(params[:short_url])
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_params
      params.fetch(:url, {}).permit(:original_url)
    end
end
