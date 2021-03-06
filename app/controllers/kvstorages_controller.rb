class KvstoragesController < ApplicationController

  before_filter :find_key, only: [:get, :destroy]
  before_filter :find_all_keys, only: [:show_all, :show_id_values]

  def index
    
  end

  #This method render forms for setting a new key, and pass it to method "set"
  def new
   @key = Kvstorage.new 
  end

  def set
    @key = Kvstorage.create(key: params[:k], value: params[:v])
    if @key.errors.empty?
      render_200
    else
      @key = Kvstorage.create(kvstorage_param)
      if @key.errors.empty?
        render_200
      else
        render "new"
      end
    end 
  end

  #This method shows all keys with id and values
  def show_id_values

  end

  #Show all keys
  def show_all
 
  end

  #Show value for selected key
  def get
    @key.increment!(:hits) 
  end

  #Delete selected key from table
  def destroy
    @key.destroy
    render_200
  end


  #Mixing values randomly
  def shuffle
      Kvstorage.transaction do
        kvhash = Hash.new
        Kvstorage.select("id, value").each do |q|
          kvhash[q.id] = {"value" => q.value}
        end
        Kvstorage.update(kvhash.keys, kvhash.values.shuffle)
      end
    render_200 
  end

  #Show all keys in decreasing order
  def stat
   @keys = Kvstorage.order('hits DESC') 
  end

  
  private

   def kvstorage_param  
     params.fetch(:kvstorage, {}).permit(:key, :value, :hits)  
   end 

#Methods for before filters

    def find_key
       @key = Kvstorage.where(key: params[:k]).first
       if !@key
         @key = Kvstorage.where(id: params[:id]).first
       end
       render_404 unless @key
    end

    def find_all_keys
      @keys = Kvstorage.order('id')
      render_404 unless @keys
    end

end
