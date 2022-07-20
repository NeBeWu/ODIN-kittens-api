class KittensController < ApplicationController
  before_action :set_kitten, only: %i[show edit update destroy]

  def index
    @kittens = Kitten.all
  end

  def show; end

  def new
    @new_kitten = Kitten.new
  end

  def create
    @new_kitten = Kitten.new(kitten_params)

    if @new_kitten.save
      redirect_to :root, notice: 'Kitten successfully created.'
    else
      render :new, alert: 'Kitten creation error.'
    end
  end

  def edit; end

  def update
    if @kitten.update(kitten_params)

      redirect_to :root, notice: 'Kitten successfully updated.'
    else
      render :edit, alert: 'Kitten update error.'
    end
  end

  def destroy
    @kitten.destroy

    redirect_to :root, status: 303, notice: 'Kitten was successfully destroyed.'
  end

  private

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
