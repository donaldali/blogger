class CommentsController < ApplicationController
	include CommentsHelper

	before_filter :require_login, except: [:create]

	def create
		@comment = Comment.new(comment_params)
		@comment.article_id = params[:article_id]

		@comment.save

		redirect_to article_path(@comment.article)
	end

  # method moved to app/helpers/comment_helper.rb
	# def comment_params
	# 	params.require(:comment).permit(:author_name, :body)
	# end
end
