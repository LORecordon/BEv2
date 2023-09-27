class TasksController < ApplicationController
    before_action :authenticate_user_by_token, only: [:index, :create]

    def index
        #params: :active(optional)
        if !params[:active]
            puts "yeah"
            tasks = Task.where(user: @user.id)
            render json: tasks
        else
            tasks = Task.where(user: @user.id, active: params[:active])
            render json: tasks
        end
    end
    
    def show
        task = Task.find(params[:id])
        render json: task
    end

    def taskQs
        #params: :task_id
        task = Task.find(params[:task_id])
        qslist = task.quests
        qs = Question.where(id: qslist)
        render json: qs
    end

    def create
        #params: :topic, :style, :difficulty
        amount = 4
        if params[:style] == 2
            amount = 2
        end
        @questions = Question.where(style: params[:style], topic: params[:topic], difficulty: params[:difficulty])
        random_questions = @questions.sample(amount) do |question|
            !random_questions.include(question)
        end
        puts "here:"
        puts random_questions
        qs_ids = random_questions.map{|question| question[:id]}
        @task = Task.create(user: @user, style: params[:style], topic: params[:topic], difficulty: params[:difficulty], quests: qs_ids)
        if @task.save
            retjson = {@task.id => random_questions}
            render json: retjson
        else
            render json: {message: "there was an error"}
        end
    end

    def update
        #params: :task_id, :double_attempts, :score
        task = Task.find(params[:task_id])
        if task.update(double_attempts: params[:double_attempts], score: params[:score], active: false)
            #Update user profile
            updateUser
            render json: {message: "OK"}
        else
            render json: {message: "NOT OK"}
        end
    
    end
    private

    def authenticate_user_by_token
        token = request.headers['Authorization']&.split(' ')&.last
        @user = User.find_by(auth_token: token)
        if @user.nil?
            render json: {error: 'unauthorized'}, status: :unauthorized
        end
    end

    def updateUser
        task = Task.find(params[:task_id])
        user = task.user
        puts "Updating user"
        points = params[:score].to_i - params[:double_attempts].to_i
        table = user.topic_difficulty
        if points < table[task.topic]
            table[task.topic] = table[task.topic] - 1
        elsif points > table[task.topic]
            table[task.topic] = table[task.topic] + 1
        end
        user.update(topic_difficulty: table)

    end

    
end