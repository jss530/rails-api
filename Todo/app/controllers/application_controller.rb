class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler
end

#our controller classes don't know about these helpers yet. Let's fix that by including these modules in the application controller.
