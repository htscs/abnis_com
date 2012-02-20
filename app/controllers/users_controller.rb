class UsersController < ApplicationController

  #before_filter :authenticate, :only => [:index, :edit, :update, :show]
  #before_filter :correct_user, :only => [:edit, :update]

  def new
    @user = User.new
    @title = "Signup"
  end

  def create
    #raise params[:user].inspect
    @user = User.new(params[:user])
    if @user.save
      #tratto utente salvato
      sign_in @user
      redirect_to user_path(@user.id),
                  :flash => { :success => "Welcome to the sample app! ciao"}
    else
      # mostro errori con partial shared/error_messages
      @title = "Signup"
      render "new"
    end
  end

  def index
    @title = "All users"
    #@users = User.all
    @users = User.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 6
  end

  def show     
    @user = User.find(params[:id])
    @title = @user.name
    @page_id = params[:page]
    #
    @selected_related = params[:selected_related]
    if @selected_related == nil
     @selected_related = 'favorites'
    end
    #
    if @selected_related == 'users'
      @users = User.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 25
    elsif @selected_related == 'people'
      # @people = Person.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 25
      @people = Person.search(params[:trova]).page(params[:page]).per_page(25).order('created_at DESC')
    end  
    #    
    @selected_go_to = params[:selected_go_to]
    if @selected_go_to == nil
      @selected_go_to = 1
    end
  end
  
  def edit
    #@user = current_user #funziona ma non l'ha usato.
    @user = User.find(params[:id])
    @title = "Edit user"
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      # It worked. User updated
      redirect_to user_path(@user.id),
                  :flash => { :success => "Dati aggiornati"}
    else
      # It failed.
      @title = "Edit user"
      render 'edit'
    end
  end

  def select_go_to_person
    @title = "Go to person"
    @person_id = params[:go_to_person]
    if params[:page]
      @page_id = params[:page]
    else
      @page_id = 1
    end
  end

  def select_related
    @title = "scegli"
    @user_id = session[:user_id]
    @selected_related = params[:selected_related]
    #session[:selected_related] = params[:selected_related]
  end

	def select_home
	  @title = "home"
	  @user_id = session[:user_id]
	  session[:selected_related] = params[:selected_related]
	end
    
  private #----------------

  def authenticate
    redirect_to login_path, 
                :flash => { :notice => "please sign in" } unless signed_in?
  end 
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless @user == current_user
  end
    
end
