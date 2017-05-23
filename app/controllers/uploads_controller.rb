class UploadsController < ApplicationController
  before_action :set_upload, only: [ :show, :edit, :update, :destroy]

  # GET /uploads
  def index
    @uploads = Upload.all
  end

  # GET /uploads/1
  def show
  end

  # GET /uploads/new
  def new
    @upload = Upload.new
  end

  # GET /uploads/1/edit
  def edit
  end

  # POST /uploads
  def create
    @upload = Upload.new(post_upload_params)

    if @upload.save
      p "*"*20
    name_ = "large_"+post_upload_params[:name].original_filename
    p "large_"+post_upload_params[:name].original_filename
    p "*"*20
        Aws.config.update({
                        region: 'us-east-1',
                        credentials: Aws::Credentials.new(ENV['ACCESS_KEY_ID'], ENV['SECRET_ACCESS_KEY'])
                      })
    s3 = Aws::S3::Resource.new(
      credentials: Aws::Credentials.new(ENV['ACCESS_KEY_ID'], ENV['SECRET_ACCESS_KEY']),
      region: 'us-east-1'
    )
    rekognition = Aws::Rekognition::Client.new(region: 'us-east-1')
    p rekognition.operation_names
    resp = rekognition.detect_faces({
                                      image:  {
                                        s3_object: {
                                          bucket: ENV['S3_BUCKET'],
                                          name: name_
                                                   }
                                              },
                                        attributes: ["ALL"]
                                    })
    p '*' * 20
    if resp.face_details[0] == nil
      p resp
      p "not able to recognize face details"
      age_low = nil
      age_high = nil
      gender_value = nil
      gender_conf = nil
      redirect_to "/shops/nil/nil/nil/nil"
    else
      p resp
      age_low = resp.face_details[0].age_range.low #=> Integer
      age_high = resp.face_details[0].age_range.high #=> Integer
      gender_value = resp.face_details[0].gender.value #=> String, one of "MALE", "FEMALE"
      gender_conf = resp.face_details[0].gender.confidence #=> Float
      redirect_to "/shops/#{age_low}/#{age_high}/#{gender_value}/#{gender_conf}"
    end
    p '8' * 20
    else
      render :new
    end

  end

  # PATCH/PUT /uploads/1
  def update
    if @upload.update(post_upload_params)
      redirect_to @upload, notice: 'Upload attachment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /uploads/1
  def destroy
    @upload.destroy
    redirect_to uploads_url, notice: 'Upload was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_upload_params
      params.require(:upload).permit(:name)
    end
end
