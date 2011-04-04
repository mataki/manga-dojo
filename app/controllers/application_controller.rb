class ApplicationController < ActionController::Base
  protect_from_forgery

  include RestGraph::RailsUtil

  before_filter :filter_setup_rest_graph, :set_current_user

  helper_method :current_user

  private
  def filter_setup_rest_graph
    rest_graph_setup(:write_cookies => true)
  end

  def set_current_user
    if rest_graph.authorized?
      @current_user = User.find_or_create_by_rest_graph!(rest_graph)
      @current_user.update_oauth_token(rest_graph.access_token)
    end
  end

  def current_user
    @current_user
  end
end
