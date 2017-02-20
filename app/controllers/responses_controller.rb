class ResponsesController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @response = @question.responses.new(option_1: params[:response][:option_1], option_2: params[:response][:option_2])
    if @response.save
      flash[:notice] = "You voted!"
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      flash[:notice] = "nope"
      redirect_to root_path
    end
  end

private

  def response_params
    params.require(:response).permit(:option_1, :option_2)
  end

end
