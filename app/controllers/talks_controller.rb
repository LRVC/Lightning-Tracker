class TalksController < ApplicationController
  def index
    @talks = Talk.all
  end

  def new
    @talk = Talk.new
  end

  def create
    @talk = Talk.new(talks_params)
    if @talk.save
      redirect_to talks_path, notice: "Your Lightning Talk was saved successfully"
    else
      render :new
    end
  end

  def show
    @talk = Talk.find(params[:id])
  end

  def edit
    @talk = Talk.find(params[:id])
  end

  def update
    @talk = Talk.find(params[:id])
    if @talk.update(talks_params)
      redirect_to talks_path, notice: "Your Lightning Talk was saved successfully"
    else
      render :edit
    end
  end

  def destroy
    @talk = Talk.find(params[:id])
    @talk.destroy
    redirect_to talks_path, notice: "Your Lightning Talk has been removed from the schedule"
  end

  private

  def talks_params
    params.require(:talk).permit(:title, :date)
  end
end
