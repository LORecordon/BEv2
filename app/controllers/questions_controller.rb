class QuestionsController < ApplicationController
    #before_action :authenticate_user_by_token

    def index
        @questions = Question.all
        puts @questions.first
        render json: @questions
    end

    def show
        question = Question.find(params[:id])
        render json: question
    end

    def find
        @questions = Question.where(style: params[:style], topic: params[:topic], difficulty: params[:difficulty])
        random_questions = @questions.sample(params[:amount].to_i) do |question|
            !random_questions.include(question)
        end
        render json: random_questions
    end

    def create
        puts params[:fake_answers]
        question = Question.create(
            prompt: params[:prompt],
            style: params[:style],
            answer: params[:answer],
            difficulty: params[:difficulty],
            topic: params[:topic],
            fake_answers: params[:fake_answers],
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

    def destroy
        qs = Question.find(params[:id])
        if qs.destroy
            render json: {message: "Question Deleted"}, status: :ok
        else
            render json: {message: "Couldnt Delete Question"}, status: :unprocessable_entity
        end
    end

    def update
        qs = Question.find(params[:id])
        if qs.update(question_params)
            render json: qs, status: :ok
        else
            render json: {error: "Couldnt Update Question"}, status: :unprocessable_entity
        end
    end

    private

    def question_params
        params.permit(:prompt, :style, :answer, :difficulty, :topic, :fake_answers, :imgPoints, :imgLines)
    end

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
