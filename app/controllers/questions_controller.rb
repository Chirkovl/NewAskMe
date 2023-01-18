class QuestionsController < ApplicationController
  before_action :set_question, only: %i[update show destroy edit]
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to question_path(@question), notice: "New question created!"
    else
      flash.now[:alert] = 'You filled in the text fields incorrectly!'

      render :new
    end
  end

  def edit
    
  end

  def update

    if @question.update(question_params)
      redirect_to question_path(@question), notice: "Question updated!"
    else
      flash.now[:alert] = 'You filled in the text fields incorrectly!'

      render :edit
    end
  end

  def index
    @question = Question.new
    @questions = Question.all
  end

  def show
  end

  def destroy
    @question.destroy

    redirect_to root_path, notice: "Question deleted!"
  end

  private

  def question_params
    params.require(:question).permit(:body, :user_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
