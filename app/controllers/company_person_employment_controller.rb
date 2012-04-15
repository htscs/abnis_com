class CompanyPersonEmploymentController < ApplicationController
  
  # PUT /companies/1
  def update
    @employment = CompanyPersonEmployment.find(params[:id])
    @employment.update_attributes(params[:company_person_employment])
    
    # current_company_id = params[:company_id]
    # current_person_id = params[:person_id]
    # CompanyPersonEmployment.create(:company_id => current_company_id, :person_id => current_person_id, :summary => "dipendente")
    
    
    redirect_to company_path(@employment.company_id, :selected_related => 'people'), :flash => { :success => "persona aggiunta!"}
    

    # if @company.update_attributes(params[:company])
    #   #It worked! devo mettere la visualizzazione del flash sul view se voglio vedere il messaggio ^_^
    #   redirect_to @company, :flash => { :success => "modifiche effettuate!"}
    #   #redirect_to @company, notice: 'Company was successfully updated.'
    # else
    #   @title = "modifica persona"
    #   render 'edit'
    #   #render action: "edit"
    # end
  end
  
end
