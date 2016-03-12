include Wildsearcher

class Car
  attr_accessor :id, :year, :make_name, :model_name, :description

  def initialize(params={})
    @id = params[:id]
    @year = params[:year]
    @make_name = params[:make_name]
    @model_name = params[:model_name]
    @description = params[:description]
  end
end
