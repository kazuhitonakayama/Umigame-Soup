class AnswersController < ApplicationController
    def index
    end
    
    def new
        @answer = Answer.new
        @post = Post.find_by(id: params[:post_id])
    end
    
      # Commnet /Commnets
      # Commnet /Commnets.json
    def create
        @answer = Answer.new(answer_params)
        @answer.user_id = current_user.id
        if @answer.save
            redirect_to :root
        else
            render action: :new
        end
    end
    def destroy
    end

    private
      def answer_params
        params.require(:answer).permit(:post_id,:body)
      end
end
