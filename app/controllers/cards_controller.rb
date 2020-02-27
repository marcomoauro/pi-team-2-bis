class CardsController < ApplicationController

  def index
    output = []
    Card.all.map{ |card|
      output = [{

      }]
    }
    output.to_json
  rescue => e
    Rails.logger.error("CARD NOT SAVED #{e} #{e.backtrace.join("\n")}")
    render status: 500, json: {error: e.to_s}
  end

  def create
    Card.create!(

    )
  rescue => e
    Rails.logger.error("CARD NOT SAVED #{e} #{e.backtrace.join("\n")}")
    render status: 500, json: {error: e.to_s}
  end

  def show
    card = Card.find(params[:id])
    
  rescue => e
    Rails.logger.error("CARD NOT SAVED #{e} #{e.backtrace.join("\n")}")
    render status: 500, json: {error: e.to_s}
  end

  def update

  end

end