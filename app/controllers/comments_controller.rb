class CommentsController < ApplicationController

  def create
    new_comment = Comment.new
    new_comment.photo_id = params.fetch("input_photo_id")
    new_comment.author_id = params.fetch("input_author_id")
    new_comment.body = params.fetch("input_comment")

    if new_comment.valid?
      new_comment.save
      redirect_to("/photos/#{new_comment.photo_id}", { :notice => "Photo created successfully." })
    else
      redirect_to("/photos#{new_comment.photo_id}", { :notice => "Photo failed to create successfully." })
    end
  end

end
