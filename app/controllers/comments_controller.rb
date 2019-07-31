class CommentsController < ApplicationController
    #before_action :find_post, only: [:find_comment]
    before_action :find_comment, only: [:edit, :destroy, :update]
    


    def create
        @post =Post.find(params[:post_id])
        @comment = @post.comments.create(comments_params)

        redirect_to post_path(@post)
    end

    def edit
    end

    def update
    end

    def destroy
        @comment.destroy

        redirect_to @post
    end




private
    def comments_params
        params.require(:comment).permit(:name, :body)
    end

    # def find_post
    #     @post = Post.find(params[:post_id])
    # end

    def find_comment
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
    end
end
