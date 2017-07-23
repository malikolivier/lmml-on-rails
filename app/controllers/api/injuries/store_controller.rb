module Api
  module Injuries
    class StoreController < ApplicationController
      # GET /injuries/store
      def show
        @examination_types = ExaminationType.includes(:body_references,
                                                      :reachable_organs)
      end
    end
  end
end
