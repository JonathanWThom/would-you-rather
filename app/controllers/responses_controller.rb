class ResponsesController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @response = @question.responses.new(params[:question_response])
    if @response.save
      flash[:notice] = "You voted!"
      respond_to do |format|
        format.html { redirect_to root_path }
        # format.js
      end
    else
      flash[:notice] = "nope"
      redirect_to root_path
    end
  end
end
