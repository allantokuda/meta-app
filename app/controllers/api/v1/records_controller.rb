class Api::V1::RecordsController < ObjectsController
  def object_params
    params.require(:record).permit!
  end
end
