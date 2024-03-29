AbnisCom::Application.routes.draw do

    root :to => "sessions#show" #named route: root_path

    resources :users
    resources :sessions, :only => [:new, :create, :destroy]
    resources :companies
    resources :people
    resources :company_person_employment
    
    #match "/home",                     :to => "home#show" #named route: home_path
    match "/login",                     :to => "sessions#new" #named route: login_path
    match "/logout",                    :to => "sessions#destroy" #named route: logout_path
    match "/signup",                    :to => "users#new" #named route: signup_path
    match "/select_go_to_person",       :to => "users#select_go_to_person" #named route: select_go_to_person_path
    match "/select_go_to_company",      :to => "users#select_go_to_company" #named route: select_go_to_company_path
    match "/users_select_related",      :to => "users#select_related" #named route: users_select_related_path
    match "/users_select_home",    	    :to => "users#select_home" #named route: users_select_home_path
    match "/people_select_related",     :to => "people#select_related" #named route: people_select_related_path
    match "/companies_select_related",  :to => "companies#select_related" #named route: companies_select_related_path
    match "/companies_connect_person",  :to => "companies#connect_person" #named route: companies_connect_person_path
    match "/companies_connect_person_update",  :to => "companies#connect_person_update" #named route: companies_connect_person_update_path
    match "/companies_employment_edit",  :to => "companies#employment_edit" #named route: companies_employment_edit_path
    match "/company_person_employment",  :to => "companies#employment_edit" #named route: company_person_employment_path (RICHIESTO DA form_for(...) su employment_edit.html.erb)
    

  #  resources :xxxs
  #
  # HTTP  | URL         | Action   | Named route     | Purpose
  # -----------------------------------------------------------------------------
  # GET     /xxxs/new     new        new_xxx_path      page to make a new xxx
  #
  # POST    /xxxs         create     xxxs_path          create a new xxx
  #
  # GET     /xxxs         index      xxxs_path         page to list all xxx
  #
  # GET     /xxxs/1       show       xxx_path(1)       page to show xxx with ID 1
  #
  # GET     /xxxs/1/edit  edit       edit_xxx_path(1)  page to edit xxx with ID 1
  #
  # PUT     /xxxs/1       update     xxx_path(1)       update xxx with ID 1
  #
  # DELETE  /xxxs/1       destroy    xxx_path(1)       delete xxx with ID 1
end
