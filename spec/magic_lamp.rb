MagicLamp.define(controller: AutopsiesController) do
  fixture do
    @autopsy = Autopsy.new
    render 'new'
  end
end
