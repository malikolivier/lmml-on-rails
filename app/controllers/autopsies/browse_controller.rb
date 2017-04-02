module Autopsies
  class BrowseController < AutopsiesController
    # GET /autopsies/:id/browse
    def show
      @autopsy = Autopsy.includes(:conclusions).find(params[:id])
      respond_to do |format|
        format.html
        format.pdf do
          render pdf: 'autopsy', template: 'autopsies/browse.html'
        end
        format.docx do
          render docx: 'autopsy', template: 'autopsies/browse.html'
        end
      end
    end
  end
end
