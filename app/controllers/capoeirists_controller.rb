class CapoeiristsController < ApplicationController
  def search
    params[:search].reject! {|k, v| v.empty?}

    if(!params[:search].empty?)
      conditions = []
      params[:search].each do |key, value|
        key == "cord" ? conditions << { key => value } : conditions << { key => Regexp.new(value) }
      end
      @capoeirists = Capoeirist.and(conditions).paginate :page => params[:page], :per_page => 20
    else
      @capoeirists = Capoeirist.paginate :page => params[:page], :per_page => 20
    end
    
    render template: 'welcome/index'
  end
end