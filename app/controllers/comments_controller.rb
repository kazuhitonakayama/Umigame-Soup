class CommentsController < ApplicationController
        before_action :set_comment, only: [:show, :edit, :update, :destroy]

        # GET /Commnets/new
        def new
          @comment = Comment.new
          @post = Post.find_by(id: params[:post_id])
        end
      
        # GET /Commnets/1/edit
        def edit
        end
      
        # Commnet /Commnets
        # Commnet /Commnets.json
        def create
            @comment = Comment.new(comment_params)
            @comment.user_id = current_user.id
            if @comment.save
                redirect_to :root
            else
                render action: :new
            end
        end
      
        # PATCH/PUT /Commnets/1
        # PATCH/PUT /Commnets/1.json
        def update
        end
      
        # DELETE /Commnets/1
        # DELETE /Commnets/1.json
        def destroy
          @post=Post.find(params[:post_id])
          @comment=@post.comments.find(params[:id])
          @comment.destroy
          redirect_to post_path(@post)
        end
      
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_comment
            @comment = Comment.find(params[:id])
          end
      
          # Only allow a list of trusted parameters through.
          def comment_params
            params.require(:comment).permit(:answer,:post_id)
          end    
end
