class RegistrationsController < Devise::RegistrationsController

  def create
    super
    UserMailer.welcome_email(resource).deliver_now unless resource.invalid?
  end

end