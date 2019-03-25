class TalksController < ApplicationController
  def top
  end
  def index
    @talks = Talk.all
  end
  def new
    @talk = Talk.new
  end
  def create
    @talk = Talk.new(talk_params)
     if params[:back]
      render "new"
     elsif
      @talk.save
      redirect_to talks_path,notice:"つぶやきを投稿しました！"
     else
      render "new"
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
     if @talk.update(talk_params)
      redirect_to talks_path,notice:"つぶやきを編集しました！"
     else
      render "edit"
     end
  end
  def destroy
    @talk = Talk.find(params[:id])
    @talk.destroy
    redirect_to talks_path 
  end
  def confirm
    @talk = Talk.new(talk_params)
  end  
  private
  def talk_params
    require(:talk).permit(:content)
  end
end