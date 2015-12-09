class RegistrationsController < Devise::RegistrationsController
  def new
    resource = build_resource({})
    set_minimum_password_length
    resource.build_address
    respond_with resource
  end

  def create
    super
  end

  def edit
    resource.build_address if resource.address.nil?
  end

  def update
    super
  end
end
