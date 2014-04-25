module Api
  class TablesController < ApplicationController
    before_action :set_table, only: [:show, :edit, :update, :destroy]

    def index
      @entities = Table.all
      render json: @entities
    end

    def show
      render json: @table
    end

    def create
      @table = Table.new(table_params)

      if @table.save
        render json: @table, status: :created
      else
        render json: @table.errors, status: :unprocessable_table
      end
    end

    def update
      if @table.update(table_params)
        head :no_content
      else
        render json: @table.errors, status: :unprocessable_table
      end
    end

    def destroy
      @table.destroy
      head :no_content
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_table
        @table = Table.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def table_params
        params.require(:table).permit(:name)
      end
  end
end
