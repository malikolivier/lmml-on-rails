module Autopsies
  # Manages preview of autopsy description from autopsy metadata
  class PreviewController < AutopsiesController
    skip_before_action :set_autopsy

    # POST /autopsies/preview
    # Post autopsy data and return a textual description of the autopsy.
    def show
      @autopsy = Autopsy.new(autopsy_params)
      setup_autopsy
    end
  end
end
