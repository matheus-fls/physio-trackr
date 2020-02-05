class MeasuresController < ApplicationController
  before_action :set_user
  before_action :set_user_measure, only: [:show, :update, :destroy]

  def index
    json_response(@user.measures)
  end

  def show
    json_response(@measure)
  end

  def create
    @user.measures.create!(measure_params)
    json_response(@user, :created)
  end

  def update
    @measure.update(measure_params)
    head :no_content
  end

  def destroy
    @measure.destroy
    head :no_content
  end

  private

    def measure_params
      params.permit(:height, :weight, :bmi, :bicep, :chest, :waist, :hips, :thigh, :calf)
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_user_measure
      @measure = @user.measures.find_by!(id: params[:id]) if @user
    end
end
