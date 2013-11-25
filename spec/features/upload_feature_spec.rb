require 'spec_helper'

describe 'uploading photos' do
  
  it 'can be uploaded from the new photo form' do
    visit new_photo_path
  end

end