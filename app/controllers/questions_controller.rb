class QuestionsController < ApplicationController
    #before_action :authenticate_user_by_token

    def index
        @questions = Question.all
        puts @questions.first
        render json: @questions
    end

    def show
        render json: @question
    end

    def find
        @questions = Question.where(style: params[:style], topic: params[:topic], difficulty: params[:difficulty])
        random_questions = @questions.sample(params[:amount].to_i) do |question|
            !random_questions.include(question)
        end
        render json: random_questions
    end

    def create
        question = Question.create(
            prompt: params[:selectedPregunta],
            style: 1,
            difficulty: 1,
            topic: params[:selectedTema],
            imgPoints: params[:savedPoints],
            imgLines: params[:savedLines]
            )
        if question.save!
            question.save
            render json: {message: "Question Created"}, status: :ok
        else
            puts question.save!
            render json: {message: "ji"}, status: :unprocessable_entity
        end 
    end

    private

    def set_question
        @question = Question.find(params[:id])
    end

    def authenticate_user_by_token
        token = request.headers['Authorization']&.split(' ')&.last
        user = User.find_by(auth_token: token)
        if user.nil?
            render json: {error: 'unauthorized'}, status: :unauthorized
        end
    end
    
end
