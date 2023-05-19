class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    def index
        @post = Post.all
    end

    def new
        @post = Post.new
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])

        if @post.update(post_params)
            redirect_to @post
        else
            flash[:error1] = @post.errors.full_messages.first
            flash[:error2] = @post.errors.full_messages.second
            redirect_to edit_post_path
        end
    end

    def destroy
        @post = Post.find(params[:id])

        @post.destroy
        redirect_to posts_path
    end

    def create
        # render plain: params[:post].inspect
        @post = Post.new(post_params)

        if @post.save
            redirect_to @post
        else
            flash[:error1] = @post.errors.full_messages.first
            flash[:error2] = @post.errors.full_messages.second
            redirect_to new_post_path
        end
    end

    private def post_params
        params.require(:post).permit(:title, :body)
    end
end
