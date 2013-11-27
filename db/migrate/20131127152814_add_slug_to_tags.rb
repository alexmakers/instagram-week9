class AddSlugToTags < ActiveRecord::Migration
  def up
    add_column :tags, :slug, :string

    Tag.all.each do |tag|
      tag.slug = tag.name.gsub('#', '').downcase
      tag.save
    end
  end

  def down
    remove_column :tags, :slug
    Tag.all.each do |tag|
      tag.slug = nil
      tag.save
    end
  end
end
