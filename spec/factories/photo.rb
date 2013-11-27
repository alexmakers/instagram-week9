FactoryGirl.define do
  factory(:photo) do
    title 'Default caption'
    image Rails.root.join('spec/images/old-man1.jpg').open
  end
end