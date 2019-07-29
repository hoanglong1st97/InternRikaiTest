ActiveAdmin.register User do
  permit_params :name, :email, :password, :password_digest
  index do
    selectable_column
    id_column
    column :name
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :name
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :password

    end
    f.actions
  end
  controller do
    def permitted_params
      params.permit post: [:name, :email, :password_digest]
    end
  end
end
