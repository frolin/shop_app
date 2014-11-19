class CartsController < InheritedResources::Base

def create



end


  private
    def cart_params
      params.require(:cart).permit()
    end
end

