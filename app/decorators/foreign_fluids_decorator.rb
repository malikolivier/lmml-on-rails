class ForeignFluidsDecorator < ApplicationCollectionDecorator
  def description
    pb = PhraseBuilder.new(comma_only: true, full_stop: false)
    each do |fluid|
      pb << fluid.description
    end
    pb.to_sentence
  end
end
