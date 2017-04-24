module Injuries
  class StoreController < ApplicationController
    def show
      @examination_types = ExaminationType.all
    end
  end
end
