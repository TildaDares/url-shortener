class ApplicationController < ActionController::Base
  def routing_error(error = 'Routing error', status = :not_found, exception=nil)
    render_exception(404, "Routing Error", exception)
  end
end
