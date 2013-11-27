class TagsController < ApplicationController

  def show
    @tag = Tag.find_by slug: params[:id]
  end

end