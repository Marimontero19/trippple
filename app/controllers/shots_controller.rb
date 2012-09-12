class ShotsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :like]

  # GET /shots
  # GET /shots.json
  def index
    page = params[:page] || 0
    @shots = Shot.likes_ordered.page(page).per(5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shots }
    end
  end

  def mine
    @shots = current_user.shots
  end

  def like
    @shot = Shot.find(params[:id])
    @shot.increment! :likes
    render :json => @shot.likes.to_json
  end

  # GET /shots/new
  # GET /shots/new.json
  def new
    @shot = Shot.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shot }
    end
  end

  # GET /shots/1/edit
  def edit
    @shot = current_user.shots.find(params[:id])
  end

  # POST /shots
  # POST /shots.json
  def create
    @shot = Shot.new(params[:shot])
    @shot.user = current_user

    respond_to do |format|
      if @shot.save
        format.html { redirect_to shots_url, :notice => "New shot created" }
        format.json { render json: @shot, status: :created, location: @shot }
      else
        format.html { render action: "new" }
        format.json { render json: @shot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shots/1
  # PUT /shots/1.json
  def update
    @shot = current_user.shots.find(params[:id])

    respond_to do |format|
      if @shot.update_attributes(params[:shot])
        format.html { redirect_to mine_url, :notice => "Shot updated" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shots/1
  # DELETE /shots/1.json
  def destroy
    @shot = current_user.shots.find(params[:id])
    @shot.destroy

    respond_to do |format|
      format.html { redirect_to mine_url, :notice => "Shot destroyed" }
      format.json { head :no_content }
    end
  end
end
