class PredictionsController < ApplicationController

  def index
    @order_by = params[:sort]
    @paginable_predictions = Prediction.filter(@is_pending_predictions_list, @order_by, params[:page], params[:q])                             
    @predictions = PredictionDecorator.decorate_collection(@paginable_predictions, :context => { :is_admin => @is_admin })
  end
  
  def new
    @prediction = Prediction.new
    @authors = Author.order(:name).all
    @form_path = predictions_path
  end
  
  def create
    @prediction = Prediction.new(params[:prediction])
    if @prediction.save
      redirect_to author_path(@prediction.author), notice: "Se ha creado la nueva predicción <b>#{@prediction.description}</b>".html_safe and return
    else
      render action: "new"
    end
  end
  
  def edit
    @prediction = Prediction.find(params[:id])
    @authors = Author.order(:name).all
    @form_path = prediction_path(@prediction)
  end
  
  def update
    @prediction = Prediction.find(params[:id])
    @prediction.update_attributes(params[:prediction])
    redirect_to @prediction.author, notice: "#{@prediction.description} modificada correctamente." and return
  end
  
  def show
    @prediction = PredictionDecorator.decorate(Prediction.find(params[:id]))
    gon.url = @prediction.url
    gon.tweet = @prediction.tweet
  end
  
end
