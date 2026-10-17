class MakeModelsController < ApplicationController
  # GET /makes/:make_id/models.json
  def index
    models = Model.where(make_id: params.expect(:make_id)).order(:name)
    render json: models
  end
end
