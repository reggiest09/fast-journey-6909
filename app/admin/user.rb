ActiveAdmin.register User do
  permit_params [:email, :password, :password_confirmation]
  actions :index, :new, :create, :show, :destroy

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  index do
    column :id
    column :email
    actions
    # actions defaults: false do |user|
    #   link_to "Show", admin_user_path(user)
    #   link_to "Delete", admin_user_path(user), method: :dele
    #   # link_to "Show", admin_user_path(user)
    # end
  end

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
