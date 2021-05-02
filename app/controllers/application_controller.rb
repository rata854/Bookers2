class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # 始めにconfigure_permitted_parametersメソッドを起動。
  # if: :devise_controller? → deviceにまつわる画面で起動。
  
  protected  
  # protectedは1対Nの場合に使う？
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # email,passwordの他にnameデータの操作を追加している。
    # （sign_up）の際に、ユーザ名（name）のデータ操作が許可。
  end
  
  
  
end
