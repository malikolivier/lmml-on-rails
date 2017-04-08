module Autopsies
  # Manages routes to browse through autopsy data
  # Autopsy data can be browsed as an HTML, PDF or DOCX document.
  class BrowseController < AutopsiesController
    decorates_assigned :autopsy

    # GET /autopsies/:id/browse
    def show
      @autopsy = Autopsy.includes(:conclusions).find(params[:id])
      respond_to do |format|
        format.html
        format.pdf do
          render pdf: 'autopsy', template: 'autopsies/browse/show.html'
        end
        format.docx do
          render docx: 'autopsy', template: 'autopsies/browse/show.html'
        end
      end
    end
  end
end
