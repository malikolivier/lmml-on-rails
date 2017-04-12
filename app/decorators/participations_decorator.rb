class ParticipationsDecorator < ApplicationCollectionDecorator
  def description_chunk
    pb = PhraseBuilder.new(only_comma: true, full_stop: false)
    decorated_collection.each do |participation|
      pb << participation.description_chunk
    end
    pb.to_sentence
  end
end
