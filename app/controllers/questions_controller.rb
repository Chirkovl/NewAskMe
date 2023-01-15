class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.create(question_params)

    redirect_to question_path(@question)
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.update(question_params)

    redirect_to question_path(@question)
  end

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to root_path
  end

  private

  def question_params
    params.require(:question).permit(:body, :user_id)
  end
end
