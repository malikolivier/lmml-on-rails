class AnalysisBloodTypeDecorator < AnalysisBaseDecorator
  def description
    return t('.uncomplete') if tried_antibodies.empty?
    t('.complete_description', experiment: experiment_description,
                               positive_tries: positive_tries_description,
                               negative_tries: negative_tries_description)
  end

  private

  def experiment_description
    antibodies = tried_antibodies
    t('.experiment', tried_antibodies: h.join_words(antibodies),
                     count: antibodies.length)
  end

  def positive_tries_description
    antibodies = positive_tries
    t('.positive_result', positive_tries: h.join_words(antibodies),
                          count: antibodies.length)
  end

  def negative_tries_description
    antibodies = negative_tries
    t('.negative_result', negative_tries: h.join_words(antibodies),
                          count: antibodies.length)
  end

  def tried_antibodies
    tried_antis = []
    %i[anti_a anti_b anti_h].each do |antibody|
      next if object.send(antibody).blank?
      translation = t(".#{antibody}")
      tried_antis.push(translation)
    end
    tried_antis
  end

  def positive_tries
    tried_antis = []
    tried_antis.push(t('.anti_a')) if object.anti_a_positive?
    tried_antis.push(t('.anti_b')) if object.anti_b_positive?
    tried_antis.push(t('.anti_h')) if object.anti_h_positive?
    tried_antis
  end

  def negative_tries
    tried_antis = []
    tried_antis.push(t('.anti_a')) if object.anti_a_negative?
    tried_antis.push(t('.anti_b')) if object.anti_b_negative?
    tried_antis.push(t('.anti_h')) if object.anti_h_negative?
    tried_antis
  end
end
