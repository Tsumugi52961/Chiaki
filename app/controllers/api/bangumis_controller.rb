# frozen_string_literal: true

module Api
  class BangumisController < ApplicationController
    def index
      @bangumis = paginate Bangumi.ransack(params[:q]).result
    end

    def show
      @bangumi = Bangumi.find(params[:id])
    end

    def create
      Bangumi.create!(bangumi_params)
      render :show
    end

    private

    def bangumi_params
      params.require(:bangumi)
            .permit(:title, :link, :magnet_link, :published_at)
    end
  end
end
