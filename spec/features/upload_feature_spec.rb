require 'spec_helper'

describe 'uploading photos' do
  
  it 'can be uploaded from the new photo form' do
    visit new_photo_path
    fill_in 'Title', with: 'My cool pic'
    attach_file 'Image', Rails.root.join('spec/images/old-man1.jpg')
    click_button 'Create Photo'

    pic = page.find 'img.uploaded-pic'
    expect(pic['alt']).not_to eq 'Missing'
  end

end