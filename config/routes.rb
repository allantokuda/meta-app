MetaApp::Application.routes.draw do
  namespace :api do
  namespace :v1 do
    get    'apps' => "apps#index" #sysadmin-only index resource
    post   'apps' => "apps#create"

    get    'apps/:id' => "apps#show"
    put    'apps/:id' => "apps#update"
    delete 'apps/:id' => "apps#destroy"
    get    'apps/:id/roles'         => "roles#index"
    post   'apps/:id/roles'         => "roles#create"
    get    'apps/:id/entities'      => "entities#index"
    post   'apps/:id/entities'      => "entities#create"
    get    'apps/:id/relationships' => "relationships#index"
    post   'apps/:id/relationships' => "relationships#create"

    get    'users' => "users#index"  #sysadmin-only index resource
    post   'users' => "users#create"

    get    'users/:id' => "users#show"
    put    'users/:id' => "users#update"
    delete 'users/:id' => "users#destroy"
    get    'users/:id/assignments' => "assignments#index" 
    post   'users/:id/assignments' => "assignments#create"

    get    'assignments/:id' => "assignments#show"
    put    'assignments/:id' => "assignments#update"
    delete 'assignments/:id' => "assignments#destroy"

    get    'roles/:id' => "roles#show"
    put    'roles/:id' => "roles#update"
    delete 'roles/:id' => "roles#destroy"
    get    'roles/:id/permissions' => "permissions#index" 
    post   'roles/:id/permissions' => "permissions#create"

    get    'permissions/:id' => "permissions#show"
    put    'permissions/:id' => "permissions#update"
    delete 'permissions/:id' => "permissions#destroy"

    get    'entities/:id' => "entities#show"
    put    'entities/:id' => "entities#update"
    delete 'entities/:id' => "entities#destroy"
    get    'entities/:id/fields' => "fields#index"
    post   'entities/:id/fields' => "fields#create"
    get    'entities/:id/views'   => "views#index"
    post   'entities/:id/views'   => "views#create"
    get    'entities/:id/records' => "records#index"
    post   'entities/:id/records' => "records#create"

    get    'fields/:id' => "fields#show"
    put    'fields/:id' => "fields#update"
    delete 'fields/:id' => "fields#destroy"

    get    'views/:id' => "views#show"
    put    'views/:id' => "views#update"
    delete 'views/:id' => "views#destroy"
    get    'views/:id/views' => "views#index"
    post   'views/:id/views' => "views#create"

    get    'relationships/:id' => "relationships#show"
    put    'relationships/:id' => "relationships#update"
    delete 'relationships/:id' => "relationships#destroy"

    get    'records/:id' => "records#show"
    put    'records/:id' => "records#update"
    delete 'records/:id' => "records#destroy"
  end
  end
end
