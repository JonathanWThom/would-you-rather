class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @response = Response.new
  end
end
