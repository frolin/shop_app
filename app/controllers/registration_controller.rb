# class RegistrationController < Devise::RegistrationController
#   def create
#     build_resource
#     alert('aaa')
#     if resource.save
#       if resource.active_for_authentication?
#         set_flash_message :notice, :signed_up if is_navigational_format?
#         sign_up(resource_name, resource)
#         return render :json => {:success => true}
#       else
#         set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
#         expire_session_data_after_sign_in!
#         return render :json => {:success => true}
#       end
#     else
#       clean_up_passwords resource
#       return render :json => {:success => false}
#     end
#   end
#
#   # Signs in a user on sign up. You can overwrite this method in your own
#   # RegistrationsController.
#   def sign_up(resource_name, resource)
#     sign_in(resource_name, resource)
#     redirect_to root_path
#   end
#
#
#   private
#
#   def sign_up_params
#     params.require(:user).permit(:name, :email, :password, :password_confirmation)
#   end
#
#   def account_update_params
#     params.require(:user).permit(:name, :avatar, :email, :password, :password_confirmation, :current_password)
#
#   end
#
#
#
# end
