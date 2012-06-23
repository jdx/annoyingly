Annoyingly::Application.routes.draw do
  resource :user, :only => [ :new, :create ]
end
