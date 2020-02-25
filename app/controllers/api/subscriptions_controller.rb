# frozen_string_literal: true

module Api
  class SubscriptionsController < ApplicationController
    def index
      @subscriptions = paginate Subscription.ransack(params[:q]).result
    end

    def show
      @subscription = Subscription.find(params[:id])
    end

    def create
      Subscription.create!(subscription_params)
      render :show
    end

    private

    def subscription_params
      params.require(:subscription).permit(:name, :rule, :status)
    end
  end
end
