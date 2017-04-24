module Injuries
  class StoreController < ApplicationController
    # GET /injuries/store
    def show
      @examination_types = ExaminationType.all
    end
  end
end
