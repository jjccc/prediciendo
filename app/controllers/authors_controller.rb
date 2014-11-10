class AuthorsController < ApplicationController

  def index
    authors = Author.all
    authors.sort!{ |a, b| b.performance <=> a.performance }
    @paginable_authors = Kaminari.paginate_array(authors).
                                  page(params[:page])
    @authors = AuthorDecorator.decorate_collection(@paginable_authors, :context => { :is_admin => @is_admin })                                
  end
  
  def show
    author = Author.find(params[:id].to_i)
    @author = AuthorDecorator.decorate(author, :context => { :is_clickable => false })
    @predictions = PredictionDecorator.decorate_collection(@author.predictions.order("created_at desc"), :context => { :is_admin => @is_admin })
  end
  
  def new
    @author = Author.new
    @form_path = authors_path
  end
  
  def create
    @author = Author.new(params[:author])
   
    if @author.save
      redirect_to author_path(@author), notice: "Se ha creado el nuevo autor <b>#{@author.name}</b>".html_safe and return
    else
      render action: "new"
    end
  end
  
  def edit
    @author = Author.find(params[:id])
    @form_path = author_path(@author)
  end
  
  def update
    @author = Author.find(params[:id])
    @author.update_attributes(params[:author])
    redirect_to @author, notice: "#{@author.name} modificado correctamente." and return
  end
  
end
