
require 'kairos'

class PicturesController < ApplicationController
  before_action :set_album
  before_action :set_picture, only: [:show, :edit, :update, :destroy]


      APP_ID = 'cabd5bef'
      APP_KEY = '4cab7035e450a92e96fe6b446f429468'

      brian_image = 'https://s3.amazonaws.com/kairos-media/team/Brain_Brackeen.jpeg'
      brian_image_2 = 'http://ourcitythoughts.org/cityth/wp-content/uploads/2014/04/Brian-Brackeen-Founder-of-Kairos-Banner.jpg'
      brian_image_3 = 'http://mediad.publicbroadcasting.net/p/wlrn/files/201401/Screen_Shot_2014-01-22_at_5.38.27_PM.png'
      brian_image_4 = 'http://miamiherald.typepad.com/.a/6a00d83451b26169e2017d3c1c3dbc970c-pi'
      kobe_image = 'http://static.basket-infos.com/wp-content/uploads/2014/11/Kobe-Bryant.png'
      bill_image = 'http://dash.coolsmartphone.com/wp-content/uploads/2013/05/gates_print.jpg'
      bill_image_2 = 'http://blogs-images.forbes.com/mfonobongnsehe/files/2014/09/bill-gates.jpg'
      walter_image = 'https://media.licdn.com/mpr/mpr/shrink_500_500/p/4/005/06e/067/0d1e2e6.jpg'
      walter_image_2 = 'http://danabassett.com.s3.amazonaws.com/badatsports/EDITION7/IMG_8772.jpg'
  
  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = @album.pictures.all
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
  end

  # GET /pictures/new
  def new
    @picture = @album.pictures.new
  end

  # GET /pictures/1/edit
  def edit
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = @album.pictures.new(picture_params)
    @client = Kairos::Client.new(app_id:  APP_ID,
                          app_key: APP_KEY)
    respond_to do |format|
      if @picture.save
        format.html { redirect_to album_picture_path(@album, @picture), notice: 'Picture was successfully created.' }
        format.json { render :show, status: :created, location: @picture }
      
      # puts "HEEEEEEEYYYYYYYYY"
      # p "Piture url:" @picture.photo.url
      # p "API INFO:" @client
      # p "Album name:" @picture.album.name

      # p picture_up = "https://mysterious-ocean-1513.herokuapp.com" + @picture.photo.url
        
        # p @client.enroll(url: picture_up,
        #         subject_id: 'Brian1001',
        #         gallery_name: @picture.album.name,
        #         selector: 'SETPOSE'
        #   )


      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to album_pictures_path, notice: 'Picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to album_pictures_path, notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  #     def enroll(pic,id,gal)
  #       @client.enroll(url: pic,
  #             subject_id: id,
  #             gallery_name: gal,
  #           selector: 'SETPOSE'
  #       )
  #     end
      


      # def recognize  
      # @client.recognize( url: 'https://s3.amazonaws.com/kairos-media/team/Brain_Brackeen.jpeg',
      #                  gallery_name: 'Photo Find Me1',
      #                  threshold: '.70',
      #                  max_num_results: '5',
      #                  selector: 'SETPOSE'
      #             )
      # end
     
      # def detect
      #   @client.detect(url: bill_image,
      #               selector: 'FACE')
      # end
        # p client.gallery_list_all

#         def 
#        @ client.gallery_view(gallery_name: "Photo Find Me1")

#       p client.gallery_remove_subject(gallery_name: 'Photo Find Me1', subject_id: 'Brian2')

# end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = @album.pictures.find(params[:id])
    end

    def set_album
      @album = Album.find(params[:album_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:photo)
    end

    def upload_params
      params.require(:picture).permit(:url, :subject_id, :gallery_name)
    end 

    def create_client
      @client = Kairos::Client.new(app_id:  APP_ID, app_key: APP_KEY)
    end 

end
