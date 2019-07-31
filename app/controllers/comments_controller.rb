class CommentsController < ApplicationController
    before_action only: [:destroy] do
        find_post
        find_comment
    end
    before_action :find_post, only: [:create]

    def create
        @comment = @post.comments.create(comments_params)

        redirect_to post_path(@post)
    end

    def destroy
        @comment.destroy

        redirect_to @post
    end

private
    def find_post
        @post = Post.find(params[:post_id])
    end

    def find_comment
        @comment = @post.comments.find(params[:id])
    end
   
    def comments_params
        params.require(:comment).permit(:name, :body)
    end
end
