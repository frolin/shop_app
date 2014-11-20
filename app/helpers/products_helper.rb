module ProductsHelper

  def reset_index_visits
    session[:counter]=0
  end

  def count_index_visits
    if session[:counter].nil?
      reset_index_visits
    else
      session[:counter]+=1
    end
  end

  def report_index_visits
    if session[:counter]==0 then
      response ="Welcome!"
    else
      counter = pluralize(session[:counter], 'time')
      response= "You are #{counter} on this page "
    end
    return response

  end



end
