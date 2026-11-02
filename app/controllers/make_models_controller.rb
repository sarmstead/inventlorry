class MakeModelsController < ApplicationController
  # GET /makes/:make_id/models.json
  def index
    models = Current.organization
                    .models
                    .with_trims
                    .where(make_id: params.expect(:make_id))
                    .order(:name)
    render json: models
  end
end
