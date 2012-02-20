class PeopleController < ApplicationController

  def new
    @person = Person.new
    @previous_person_id = params[:current_person_id] #se lanciato da person_show 
    @previous_selected_related = params[:current_selected_related]
    @title = "Persona"
  end

  def create
     #raise params[:person].inspect
    @person = Person.new(params[:person])
    if @person.save
      #tratto utente salvato
      #redirect_to user_path(session["user_id"]),
      redirect_to @person, :flash => { :success => "nuova persona creata!"}
    else
      # mostro errori con partial shared/error_messages
      @title = "Persona Errore"
      render "new"
    end 
  end
  
  def index
    @title = "All users"
    #@people = Person.all
    @people = Person.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 6
  end

  def show
    @current_user_id = session["user_id"]
    @person = Person.find(params[:id])
    @title = @person.first_name
    @page_id = params[:page]
    # session[:person_id] = params[:id]
    #
    @selected_related = params[:selected_related]
    if @selected_related == nil
      @selected_related = 'favorites'
    end
    #
    if @selected_related == 'people'
      @people = Person.search(params[:trova]).page(params[:page]).per_page(25).order('created_at DESC')
    elsif @selected_related == 'companies'
      # da fare
    end      
  end

  def edit
    @person = Person.find(params[:id])
    @title = "modifica persona"
  end

  def update
    @person = Person.find(params[:id])
    if @person.update_attributes(params[:person])
      #It worked! devo mettere la visualizzazione del flash sul view se voglio vedere il messaggio ^_^
      redirect_to @person, :flash => { :success => "modifiche effettuate!"}
    else
      @title = "modifica persona"
      render 'edit'
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    @user = User.find(session["user_id"])
    redirect_to @user, :flash => { :success => "persona eliminata!"}
  end
  
  def select_related
    @title = "scegli"
    #@user_id = session[:user_id] #??! mi serve?
    @person_id = params[:person_id] #ATTENZIONE! non ho usato sessione per person
    @selected_related = params[:selected_related]
  end
    
end
