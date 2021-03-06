class PhotosController < ApplicationController
  http_basic_authenticate_with name: "kadroadmin", password: "phototo2017" , except: [:check , :download]
  before_action :set_photo, only: [:show, :edit, :update, :destroy,:alert_photo_ready]


  def alert_photo_ready
      p = "سلام، #{@photo.first_name if @photo.first_name.present?} #{@photo.last_name if @photo.last_name.present?} عزیز، عکس های شما آماده شده است.، از آدرس زیر می تونید مشاهده و دانلود کنید :) \n http://phototo.kadro.co \n کد خصوصی شما: #{@photo.pass} \n تیم کادرو"
      res = send_sms(@photo.phone , p)
      @photo.alerted = true
      @photo.save
      redirect_to @photo , notice: "پیام ارسال شد"
  end

  def check
    if params[:pass].present?
      pass = params[:pass]
      if Photo.exists?(pass: pass)
        p = Photo.find_by_pass(pass)
        redirect_to download_photo_path(p.pass)
      else
        redirect_to root_path , :notice => "آخ، پیدا نشد، کد خصوصیت رو چک کن دوباره :)"
      end
    else
      redirect_to root_path , :notice => " کد خصوصیت رو وارد کن :)"
    end
  end

  def download
    @photo = Photo.find_by_pass(params[:id])
    @photo.view_times = @photo.view_times + 1
    @photo.save
  end


  # GET /photos
  # GET /photos.json
  def index
    # byebug
    @photos = Photo.all
  end

  # GET /photos/1
  # GET /photos/1.json
  def show

  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_photo
    @photo = Photo.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def photo_params
    params.require(:photo).permit(:first_name, :last_name, :published , :pass , :phone, :email , :number , { avatars: [] }  )
  end
end
