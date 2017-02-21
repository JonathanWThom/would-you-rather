class ResponsesController < ApplicationController
  def create

    @question = Question.find(params[:question_id])
    @response = @question.responses.new(option_1: response_params[:option_1], option_2: response_params[:option_2], user_id: current_user.id)
    if @response.save
      flash[:notice] = "You voted!"
      @question_response = nil;
      if @question.responses.where(user_id: current_user.id)[0].option_1
        @question_response = @question.option_1
      else
        @question_response = @question.option_2
      end
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    @response = Response.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @response = Response.find(params[:id])
    if comment_params[:comment] != "" && @response.update(comment_params)
      flash[:notice] = "You left a comment!"
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      flash[:notice] = 'nope'
      redirect_to root_path
    end
  end

private

  def response_params
    params.require(:response).permit(:option_1, :option_2)
  end

  def comment_params
    params.require(:response).permit(:comment)
  end
end
