# frozen_string_literal: true

module Api
  module V1
    class CommentsController < ApplicationController
      def create
        @comment = @post.comments.new(comment_params)
        if @comment.save
          PostsChannel.broadcast_to(@post, @comment.body)
          redirect_to @post, notice: 'Comment was successfully created.'
        else
          render :new
        end
      end
    end
  end
end
