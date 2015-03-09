class CreateCarouselImages < ActiveRecord::Migration
  def change
    create_table :carousel_images do |t|
    	t.integer "position"
    	t.string "image"
    	t.string "title"
    	t.string "description"
    end
  end
end
