class Api::V1::EntitiesController < ObjectsController
  def object_params
    params.require(:entity).permit(:name, :data_fields => [:name, :type])
  end
end
