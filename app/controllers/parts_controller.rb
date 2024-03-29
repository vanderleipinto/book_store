class PartsController < ApplicationController
  before_action :set_part, only: %i[ show edit update destroy ]

  # GET /parts or /parts.json
  def index
    
    if params[:search_part].present?
      @parts = Part.where("name LIKE ?", "%#{params[:search_part]}%")
    else
      @parts = Part.all
    end

  end

  # GET /parts/1 or /parts/1.json
  def show
  end

  # GET /parts/new
  def new
    @part = Part.new
  end

  # GET /parts/1/edit
  def edit
  end

  # POST /parts or /parts.json
  def create
    params = part_params
    #Chancge the ',' into '.' in params[:value], otherwise the database would receive only the int number.
    params[:value].sub!(",", ".")
    
    @part = Part.new(params)

    respond_to do |format|
      if @part.save
        format.html { redirect_to part_url(@part), notice: "Part was successfully created." }
        format.json { render :show, status: :created, location: @part }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parts/1 or /parts/1.json
  def update
    params = part_params
    #Chancge the ',' into '.' in params[:value], otherwise the database would receive only the int number.
    params[:value].sub!(",", ".")
    respond_to do |format|
      if @part.update(params)
        format.html { redirect_to part_url(@part), notice: "Part was successfully updated." }
        format.json { render :show, status: :ok, location: @part }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parts/1 or /parts/1.json
  def destroy
    @part.destroy!

    respond_to do |format|
      format.html { redirect_to parts_url, notice: "Part was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part
      @part = Part.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def part_params
      params.require(:part).permit(:name, :supplier_id, :value)
    end
end
