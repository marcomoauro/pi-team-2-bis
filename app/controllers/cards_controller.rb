class CardsController < ApplicationController

  def index
    render status: 200, json: Card.all.map(&:to_hash).to_json
  rescue => e
    Rails.logger.error("CARD NOT SAVED #{e} #{e.backtrace.join("\n")}")
    render status: 500, json: {error: e.to_s}
  end

  def create
    card = Card.create!(
      status: 'TODO',
      user:   params[:user]
    )
    render status: 200, json: card.to_hash.to_json
  rescue => e
    Rails.logger.error("CARD NOT SAVED #{e} #{e.backtrace.join("\n")}")
    render status: 500, json: {error: e.to_s}
  end

  def show
    render status: 200, json: Card.find(params[:id]).to_hash.to_json
  rescue => e
    Rails.logger.error("CARD NOT SAVED #{e} #{e.backtrace.join("\n")}")
    render status: 500, json: {error: e.to_s}
  end

  def update
    card = Card.find(params[:id])
    [:status, :user].each{ |field|
      card.update!(field => params[field]) if params.key?(field)
    }
    render status: 200, json: card.to_hash.to_json
  rescue => e
    Rails.logger.error("CARD NOT SAVED #{e} #{e.backtrace.join("\n")}")
    render status: 500, json: {error: e.to_s}
  end

end