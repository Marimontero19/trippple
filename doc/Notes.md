
    rails new trippple
    cd trippple
    rails server
    rails generate scaffold shot title:string
    rake db:migrate
    change root path
    rm public/index.html
    gem mini_magick
    gem carrierwave
    bundle
    rails generate uploader ShotImage
    version :tripppple, resize_to_fill => [400, 300], uncoment minimagick
    rake db:migrate
    mount_uploader :shot_image, ShotImageUploader
    form file_field shot_image
    show <%= image_tag @shot.shot_image.trippple.url %>
    restart server

    gem "twitter-bootstrap-rails", :group => :assets
    bundle
    restart server
    rails g bootstrap:install
    rails g bootstrap:layout -f
    rails g bootstrap:themed shots -f
    Fix form
    fix layout
    fix index



# Goals

- List of shots
- Interface to update
- Interface to delete
- Interface to edit

