module PhotosHelper

  def tag_names(photo)
    tag_links = photo.tags.map do |tag|
      link_to(tag.name, tag)
    end

    tag_links.join(", ").html_safe
  end
  
end
