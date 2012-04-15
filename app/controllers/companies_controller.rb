class CompaniesController < ApplicationController

  # GET /companies
  def index
    @title = "tutte le aziende"
    #@companies = Company.all
    @companies = Company.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 6
  end

  # GET /companies/1
  def show
    @current_user_id = session["user_id"]
    @company = Company.find(params[:id])
    @page_id = params[:page]
    #
    @selected_related = params[:selected_related]
    if @selected_related == nil
      @selected_related = 'favorites'
    end
    #
    if @selected_related == 'people'
      #@people = Person.search(params[:trova]).page(params[:page]).per_page(25).order('created_at DESC')
      @people = @company.people.search(params[:trova]).page(params[:page]).per_page(25).order('created_at DESC')
    elsif @selected_related == 'companies'
      @companies = Company.search(params[:trova]).page(params[:page]).per_page(25).order('created_at DESC')
      # @companies = @company.company_groups.search(params[:trova]).page(params[:page]).per_page(25).order('created_at DESC')
      # devo creare un self.join che collega company con company (company_groups)
    end 
    #
    if params[:trova] == nil || params[:trova] == ""
      @ico_new_status = 'disabled'
    elsif
      @ico_new_status = 'enabled'  
    end
    #      
  end

  # GET /companies/new
  def new
    @company = Company.new
        @person = Person.new # ?!?
    @previous_company_id = params[:current_company_id] #se non sono su company->company allora è nil
    @previous_selected_related = params[:current_selected_related]
    @user_id = session[:user_id]
    @title = "Azienda"
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
    @title = "modifica azienda"
  end

  # POST /companies
  def create
    #raise params[:company].inspect
    @company = Company.new(params[:company])

    if @company.save
      #tratto utente salvato
      #redirect_to user_path(session["user_id"]),
      redirect_to @company, :flash => { :success => "nuova azienda creata!"}
      #redirect_to @company, notice: 'Company was successfully created.' 
    else
      # mostro errori con partial shared/error_messages
      @title = "Azienda Errore"
      render "new"
      #render action: "new" 
    end 
  end

  # PUT /companies/1
  def update
    @company = Company.find(params[:id])

    if @company.update_attributes(params[:company])
      #It worked! devo mettere la visualizzazione del flash sul view se voglio vedere il messaggio ^_^
      redirect_to @company, :flash => { :success => "modifiche effettuate!"}
      #redirect_to @company, notice: 'Company was successfully updated.'
    else
      @title = "modifica persona"
      render 'edit'
      #render action: "edit"
    end
  end

  # DELETE /companies/1
  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    @user = User.find(session["user_id"])
    redirect_to @user, :flash => { :success => "azienda eliminata!"}
    #redirect_to companies_url
  end

  def select_related
    @title = "scegli"
    @company_id = params[:company_id] #ATTENZIONE! non ho usato sessione per company
    @selected_related = params[:selected_related]
  end

  def connect_person
    @title = "associa"
    @people = Person.search(params[:trova]).page(params[:page]).per_page(25).order('created_at DESC')
    @company_id = params[:current_company_id]
  end

  def connect_person_update
    # aggiunge la persona e la mostra
     current_company_id = params[:company_id]
     current_person_id = params[:person_id]
     CompanyPersonEmployment.create(:company_id => current_company_id, :person_id => current_person_id, :summary => "dipendente")
 #   if @company.people.update_attributes(params[:company])
 #     #It worked! devo mettere la visualizzazione del flash sul view se voglio vedere il messaggio ^_^
 #     redirect_to @company, :flash => { :success => "modifiche effettuate!"}
 #     #redirect_to @company, notice: 'Company was successfully updated.'
 #   else
 #     @title = "modifica persona"
 #     render 'edit'
 #     #render action: "edit"
 #   end
      redirect_to company_path(current_company_id, :selected_related => 'people'), :flash => { :success => "persona aggiunta!"}
 #    redirect_to @company, :selected_related => 'people', :flash => { :success => "persona aggiunta!"}
  end
  
  # GET /companies/1/edit
  def employment_edit
    @employment = CompanyPersonEmployment.find(params[:employment_id])
    @title = "modifica impiego"
    #
    @previous_company_id = params[:company_id]
    @company = Company.find(params[:company_id])
    @previous_selected_related = "people"
    
  end
  
end
