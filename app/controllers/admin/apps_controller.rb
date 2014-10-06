class Admin::AppsController < ApplicationController
before_action :set_app, only: [:show, :edit, :update, :destroy]
layout 'admin'
  # GET /apps
  # GET /apps.json
  def index
    @apps = App.all
  end

  # GET /apps/1
  # GET /apps/1.json
  def show
  end

  # GET /apps/new
  def new
    @app = App.new
  end

  # GET /apps/1/edit
  def edit
  end

  # POST /apps
  # POST /apps.json
  def create
    @app = App.new(app_params)
    id = @app.store_id

    app_data = JSON.parse(open("https://itunes.apple.com/lookup?id=#{id}").read)['results']
    @app.price = app_data.first["price"]
    @app.rating = app_data.first["averageUserRating"]
    @app.img = app_data.first["artworkUrl60"]
    @app.description = app_data.first["description"]
    @app.name = app_data.first["trackName"]
    @app.genre = app_data.first["genres"]

    respond_to do |format|
      if @app.save
        format.html { redirect_to [:admin, @app], notice: 'App was successfully created.' }
        format.json { render :show, status: :created, location: [:admin, @app] }
      else
        format.html { render :new }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apps/1
  # PATCH/PUT /apps/1.json
  def update
    respond_to do |format|
      if @app.update(app_params)
        format.html { redirect_to [:admin, @app], notice: 'App was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @app] }
      else
        format.html { render :edit }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apps/1
  # DELETE /apps/1.json
  def destroy
    @app.destroy
    respond_to do |format|
      format.html { redirect_to admin_apps_url, notice: 'App was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app
      @app = App.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_params
      params.require(:app).permit(:name, :store_id, :reflink, :img, :price, :rating, :description, :genre)
    end
end
