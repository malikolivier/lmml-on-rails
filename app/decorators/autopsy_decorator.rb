class AutopsyDecorator < ApplicationDecorator
  decorates_association :examinations
  decorates_association :ordered_analyses
  decorates_association :police_inspector
  decorates_association :suspect
  decorates_association :judge
  decorates_association :victim
  decorates_association :place
  decorates_association :participations

  def introduction_text
    if police_inspector.present?
      t('.introduction_text_with_policeman',
        date: date_chunk, policeman: policeman_chunk, suspect: suspect_chunk,
        judge: judge_chunk, victim: victim_chunk)
    else
      t('.introduction_text_without_policeman',
        date: date_chunk, suspect: suspect_chunk,
        judge: judge_chunk, victim: victim_chunk)
    end
  end

  def second_paragraph_text
    t('.second_paragraph', place: place_chunk,
                           time_interval: time_interval_chunk,
                           participants: participants_chunk)
  end

  def victim_description
    victim.death_information
  end

  def autopsy_records
    generator = LmmlOnRails::AutopsyRecordRenderer.new
    examinations.each { |examination| generator << examination }
    ordered_analyses.each { |analysis| generator << analysis }
    generator.html
  end

  private

  def date_chunk
    return '' if model.autopsy_date.blank?
    date = model.autopsy_date.to_era(t('time.formats.official_date'))
    t('.date_chunk', date: date)
  end

  def policeman_chunk
    return '' if police_inspector.blank?
    policeman = police_inspector.full_name_with_title(t('.police_inspector'))
    t('.policeman_chunk', policeman: policeman)
  end

  def suspect_chunk
    return '' if suspect.blank?
    t('.suspect_chunk', suspect_name: suspect.name)
  end

  def judge_chunk
    return '' if judge.blank?
    t('.judge_chunk', judge: judge.full_name_with_title)
  end

  def victim_chunk
    if victim.present?
      t('.victim_chunk', victim: victim.death_information)
    else
      t('.unknown_victim')
    end
  end

  def place_chunk
    return '' if place.blank?
    t('.place_chunk', place: place.autopsy_room_address)
  end

  def time_interval_chunk
    interval = TimeInterval.format(model.starting_time, model.ending_time)
    return '' if interval.blank?
    t('.interval_chunk', interval: interval)
  end

  def participants_chunk
    participations.description_chunk
  end
end
