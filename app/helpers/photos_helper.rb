module PhotosHelper

  def tag_names(photo)
    photo.tags.pluck(:name).join(", ")
  end
  
end
