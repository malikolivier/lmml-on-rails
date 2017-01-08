MagicLamp.define(controller: AutopsiesController) do
  fixture do
    @autopsy = Autopsy.new
    render 'new'
  end

  fixture(name: 'edit_empty') do
    @autopsy = Autopsy.create!
    render 'edit'
  end

  fixture(name: 'edit_completed') do
    @autopsy = Autopsy.find_by(number: '000001')
    render 'edit'
  end
end
