class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def index
    @questions = Question.all
  end

  def create
    @question = Question.create(question_params)

    redirect_to question_path(@question)
  end

  def show
    @question = Question.find(params[:id])
  end

  private

  def question_params
    params.require(:question).permit(:body, :user_id)
  end
end
