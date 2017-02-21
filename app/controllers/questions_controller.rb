class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @response = Response.new
  end
  def new
    @question = Question.new
  end

  def create
    @questions = Question.all
    @question = Question.new(question_params)
    @response = Response.new
    if @question.save
      flash[:notice] = "Question successfully added!"
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:content, :option_1, :option_2, :photo_1, :photo_2)
  end
end
