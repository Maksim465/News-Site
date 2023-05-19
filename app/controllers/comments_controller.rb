class CommentsController < ApplicationController
    before_action :authenticate_user!, only: [:edit, :update, :destroy]
    before_action :set_post
    before_action :set_comment, only: [:edit, :update, :destroy]
  
    def create
        @comment = @post.comments.create(comment_params)
        redirect_to post_path(@post)
    end
  
    def edit
        
    end
  
    def update
        if @comment.update(comment_params)
            redirect_to post_path(@post)
        else
            render :edit
        end
    end
  
    def destroy
        @comment.destroy
        redirect_to post_path(@post)
    end
  
    private 
  
    def set_post
        @post = Post.find(params[:post_id])
    end
  
    def set_comment
        @comment = @post.comments.find(params[:id])
    end
  
    def comment_params
        params.require(:comment).permit(:username, :body)
    end
  end
  