class AnimalsController < ApplicationController
  before_action :set_animal, only: %I[show edit update]
  def index
    @animals = Animal.all
  end

  def show
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user

    if @animal.save
      redirect_to animals_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @animal.update(animal_params)
      redirect_to @animal, notice: "#{@animal.name} was successfully updated."
    else
      render :edit
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :age, :city, :price, :photo, :description, :breed, :colour)
  end

  def set_animal
    @animal = Animal.find(params[:id])
  end
end
