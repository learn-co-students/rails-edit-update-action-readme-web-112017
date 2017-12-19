class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
	end

	def create
	  @post = Post.new
	  @post.title = params[:title]
	  @post.description = params[:description]
	  @post.save
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		title = !params[:title].empty? ? params[:title] : @post.title
		description = !params[:description].empty? ? params[:description] : @post.description
		@post.update(title: title, description: description)
		redirect_to post_path(@post)
	end
end
