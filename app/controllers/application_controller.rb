require 'rhino_util'

class ApplicationController < ActionController::Base
  include RhinoUtil
  protect_from_forgery
end
