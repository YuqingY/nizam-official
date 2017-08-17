
ActiveAdmin.register User do
  index do
    selectable_column
    column :email
    column :name
    column :position
    column :admin
    column :created_at
    actions
  end

  form do |f|
    f.inputs "Identity" do
      f.input :name
      f.input :email
      f.input :password
      f.input :position
    end

    f.inputs "Admin" do
      f.input :admin
    end
    f.actions
  end

  permit_params :name, :email, :password, :position # etc...
end

