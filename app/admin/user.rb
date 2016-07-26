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

  index :title => "2016-2017 After School List" do
    column :id
    column :email
    column :created_at
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

  show do
    attributes_table do
      row :first_name
      row :last_name 
      row :email
      row :home_address
      row :home_city
      row :home_state
      row :home_zip_code
      row :ada_accommodation
      row :child_name do
        div do
          User.find_by_id(user.id).children_names.present? ? User.find_by_id(user.id).children_names.to_json : []
        end
     end
    end
    active_admin_comments
  end
  controller do
    def scoped_collection
      # some stuffs
      super.where("created_at >= ? AND created_at <= ?", Time.now.beginning_of_year,Time.now.next_year)
    end 
  end

end
