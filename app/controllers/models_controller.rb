class ModelsController < ApplicationController
  before_action :set_model, only: %i[ show edit update destroy ]

  # GET /models or /models.json
  def index
    @models = Current.organization.models
  end

  # GET /models/1 or /models/1.json
  def show
  end

  # GET /models/new
  def new
    @model = Current.organization.models.new
    @makes = Current.organization.makes.pluck(:name, :id)
  end

  # GET /models/1/edit
  def edit
    @makes = Current.organization.makes.pluck(:name, :id)
  end

  # POST /models or /models.json
  def create
    # TODO: append Current.organization to expected params
    @model = Current.organization.models.new(model_params)

    respond_to do |format|
      if @model.save
        format.html { redirect_to @model, notice: "Model was successfully created." }
        format.json { render :show, status: :created, location: @model }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @model.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /models/1 or /models/1.json
  def update
    respond_to do |format|
      if @model.update(model_params)
        format.html { redirect_to @model, notice: "Model was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @model }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @model.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /models/1 or /models/1.json
  def destroy
    @model.destroy!

    respond_to do |format|
      format.html { redirect_to models_path, notice: "Model was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model
      @model = Current.organization.models.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def model_params
      params.expect(model: [ :name, :make_id, :organization_id  ])
    end
end
