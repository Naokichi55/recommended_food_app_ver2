class FoodsController < ApplicationController
  before_action :set_food, only: %i[edit update destroy]

  def index
    @foods = Food.includes(:user).order(created_at: :asc)
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def edit; end

  def create
    food = current_user.foods.create!(food_params)
    if food.save
      redirect_to food, notice: "料理情報を入力しました。"
    else
      render :error_handling, status: :unprocessable_entity
    end
  end

  def update
    @food.update!(food_params)
    if @food.update!(food_params)
      redirect_to @food
    else
      render :error_handling, status: :unprocessable_entity
    end
  end

  def destroy
    @food.destroy!
    redirect_to root_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :comment, :avatar)
  end

  def set_food
    @food = current_user.foods.find_by(id: params[:id])
    return if @food.present?

    redirect_to root_path, alert: "権限がありません"
  end
end
