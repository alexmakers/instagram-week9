require 'spec_helper'

describe 'tags' do

  before do
    @tag = create(:yolo)
    create(:photo, title: 'Cool pic', tags: [@tag])
    create(:photo, title: 'Another pic')
  end

  it 'can see all the photos for a particular tag' do
    visit tag_path(@tag)
    expect(page).to have_content 'Cool pic'
    expect(page).not_to have_content 'Another pic'
  end

end