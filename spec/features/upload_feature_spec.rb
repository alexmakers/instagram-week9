require 'spec_helper'

def upload_new_photo(submit = true)
  visit new_photo_path
  fill_in 'Title', with: 'My cool pic'
  attach_file 'Image', Rails.root.join('spec/images/old-man1.jpg')
  click_button 'Create Photo' if submit
end

describe 'uploading photos' do
  
  context 'logged out' do
    it 'should prompt you to sign in' do
      visit new_photo_path
      expect(page).to have_content 'Sign in'
      expect(page).not_to have_field 'Title'
    end
  end

  context 'logged in' do
    before do
      login_as create(:user)
    end

    it 'can be uploaded from the new photo form' do
      upload_new_photo

      pic = page.find 'img.uploaded-pic'
      expect(pic['alt']).not_to eq 'Missing'
    end

    it 'shows the email address of the uploader of the photo' do
      upload_new_photo
      
      expect(page).to have_content 'alex@example.com'
    end

    it 'can have tags added' do
      upload_new_photo(false)
      fill_in 'Tags', with: '#YOLO #LOL'
      click_button 'Create Photo' 

      expect(page).to have_content '#YOLO, #LOL'
    end
  end

end