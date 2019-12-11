class YugiohSetsController < ApplicationController
  before_action :set_yugioh_set, only: [:show, :edit, :update, :destroy]
  skip_before_action :logged_in?, only:[:index]


  # GET /yugioh_sets
  # GET /yugioh_sets.json
  def index
    @yugioh_sets = YugiohSet.all
    @years = YugiohSet.select(:year).map(&:year).uniq
    @years = @years.sort
    @data = []
    @years.each do |year|
      count = YugiohSet.where("year = ?", "#{year}").count
      @data.push(count)
    end
  end

  # GET /yugioh_sets/1
  # GET /yugioh_sets/1.json
  def show
  end

  # GET /yugioh_sets/new
  def new
    @yugioh_set = YugiohSet.new
  end

  # GET /yugioh_sets/1/edit
  def edit
  end

  # POST /yugioh_sets
  # POST /yugioh_sets.json
  def create
    @yugioh_set = YugiohSet.new(yugioh_set_params)
    respond_to do |format|
      if @yugioh_set.save
        if current_user != nil
          MyLog.debug "YugiohSet #{@yugioh_set.id}created by user name #{current_user.name} with email #{current_user.email}"
        end
        format.html { redirect_to @yugioh_set, notice: 'Yugioh set was successfully created.' }
        format.json { render :show, status: :created, location: @yugioh_set }
      else
        format.html { render :new }
        format.json { render json: @yugioh_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yugioh_sets/1
  # PATCH/PUT /yugioh_sets/1.json
  def update
    respond_to do |format|
      if @yugioh_set.update(yugioh_set_params)
        MyLog.debug "YugiohSet #{@yugioh_set.id}updated by user name #{current_user.name} with email #{current_user.email}"
        format.html { redirect_to @yugioh_set, notice: 'Yugioh set was successfully updated.' }
        format.json { render :show, status: :ok, location: @yugioh_set }
      else
        format.html { render :edit }
        format.json { render json: @yugioh_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yugioh_sets/1
  # DELETE /yugioh_sets/1.json
  def destroy
    MyLog.debug "YugiohSet #{@yugioh_set.id}destroyed by user name #{current_user.name} with email #{current_user.email}"
    @yugioh_set.destroy
    respond_to do |format|
      format.html { redirect_to yugioh_sets_url, notice: 'Yugioh set was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yugioh_set
      @yugioh_set = YugiohSet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yugioh_set_params
      params.require(:yugioh_set).permit(:name, :code, :year)
    end
end
