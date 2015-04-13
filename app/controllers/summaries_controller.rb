class SummariesController < ApplicationController
  def index
     @summaries = Summary.all
     #authorize @summaries
  end

  def new
     @summary = Summary.new
     #authorize @summary
  end

  def show
     @summary = Summary.find(params[:id])
     @post = @summary.post
     #authorize @summary
  end

  def edit
     @summary = Summary.find(params[:id])
     #authorize @summary
  end
 
   def create
     @summary = Summary.new(params.permit(:description))
     #authorize @summary
     if @summary.save
       redirect_to @summary, notice: "Summary was saved successfully."
     else
       flash[:error] = "Error creating summary. Please try again."
       render :new
     end
   end
 
   def update
     @topic = Summary.find(params[:id])
     #authorize @summary
     if @summary.update_attributes(params.permit(:description))
       redirect_to @summary
     else
       flash[:error] = "Error saving summary. Please try again."
       render :edit
     end
   end
end