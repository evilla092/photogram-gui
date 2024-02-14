class PhotosController < ApplicationController

  def list

    @photos_list = Photo.all
    render(template: "photo_templates/list")
  end

  def create
    @new_photo = Photo.new

    @new_photo.image = params.fetch("input_image")
    @new_photo.caption = params.fetch("input_caption")
    @new_photo.owner_id = params.fetch("input_owner_id")

    if @new_photo.valid?
      @new_photo.save
      redirect_to("/photos/#{@new_photo.id}", { :notice => "Photo created successfully." })
    else
      redirect_to("/photos/#{@new_photo.id}", { :notice => "Photo failed to create successfully." })
    end

  end

  def details
    photo_id = params.fetch("photo_id")
    @the_photo = Photo.where(id: photo_id).first
    render(template: "photo_templates/details")
  end

  def destroy
    the_id = params.fetch("photo_id")
    the_photo = Photo.where({ :id => the_id }).at(0)

    the_photo.destroy

    redirect_to("/photos", { :notice => "Photo deleted successfully."} )
  end

  def update
    the_id = params.fetch("photo_id")
    updated_photo = Photo.where(id: the_id).first
    updated_photo.image = params.fetch("input_image")
    updated_photo.caption = params.fetch("input_caption")
    if updated_photo.valid?
      updated_photo.save
      redirect_to("/photos/#{updated_photo.id}", { :notice => "User updated successfully." })
    else
      redirect_to("/photos/#{updated_photo.id}", { :notice => "User failed to update successfully." })
    end


  end
end
