class TrimsController < ApplicationController
  before_action :set_trim, only: %i[ show edit update destroy ]

  # GET /trims or /trims.json
  def index
    @trims = Trim.all
  end

  # GET /trims/1 or /trims/1.json
  def show
  end

  # GET /trims/new
  def new
    @trim = Trim.new
  end

  # GET /trims/1/edit
  def edit
  end

  # POST /trims or /trims.json
  def create
    @trim = Trim.new(trim_params)

    respond_to do |format|
      if @trim.save
        format.html { redirect_to @trim, notice: "Trim was successfully created." }
        format.json { render :show, status: :created, location: @trim }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @trim.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /trims/1 or /trims/1.json
  def update
    respond_to do |format|
      if @trim.update(trim_params)
        format.html { redirect_to @trim, notice: "Trim was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @trim }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @trim.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /trims/1 or /trims/1.json
  def destroy
    @trim.destroy!

    respond_to do |format|
      format.html { redirect_to trims_path, notice: "Trim was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trim
      @trim = Trim.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def trim_params
      params.expect(trim: [ :name, :model_id ])
    end
end
