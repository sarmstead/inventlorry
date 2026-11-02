class ModelTrimsController < ApplicationController
  # GET /models/:model_id/trims.json
  def index
    trims = Current.organization
                   .trims
                   .where(model_id: params.expect(:model_id))
                   .order(:name)
    render json: trims
  end
end
