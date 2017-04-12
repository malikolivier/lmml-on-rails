module LmmlOnRails
  # rubocop:disable Metrics/ClassLength
  # TODO: When all decorators will be implented, this class should be shorted
  # enough shorted.
  # Generate main part of the autopsy report
  class AutopsyRecordRenderer
    include ActionView::Helpers::TagHelper

    class PushError < RuntimeError
    end

    attr_accessor :html

    def initialize
      @external_examination_started = false
      @internal_examination_started = false
      @analyses_started = false
      @internal_head_examination_started = false
      @internal_torso_examination_started = false
      @section_count = 0
      @syoken_count = 0
      @kaiken_count = 0
      @html = ''
    end

    def <<(object)
      if object.instance_of? ExaminationDecorator
        add_examination(object)
      elsif object.instance_of? AnalysisDecorator
        add_analysis(object)
      else
        raise PushError, 'Can only push instances of examinations or analyses'
      end
    end

    private

    def add_examination(examination)
      insert_external_subtitle(examination)
      insert_internal_subtitle(examination)
      insert_examination_subsubtitle(examination)
      insert_paragraph(examination)
      @html << examination.note_description
      @html << examination.injuries_description
    end

    def insert_external_subtitle(examination)
      return unless examination.external? && !@external_examination_started
      @external_examination_started = true
      @syoken_count += 1
      subtitle = I18n.t('section_title.subtitle',
                        title: I18n.t('section_title.external_examination'),
                        number: @syoken_count.to_full_width)
      @html << content_tag(:h3, subtitle)
    end

    def insert_internal_subtitle(examination)
      return unless examination.internal?
      insert_internal_main_subtitle
      insert_internal_head_subtitle(examination)
      insert_internal_torso_subtitle(examination)
    end

    def insert_internal_main_subtitle
      return if @internal_examination_started
      @internal_examination_started = true
      @syoken_count += 1
      subtitle = I18n.t('section_title.subtitle',
                        title: I18n.t('section_title.internal_examination'),
                        number: @syoken_count.to_full_width)
      @html << content_tag(:h3, subtitle)
    end

    def insert_internal_head_subtitle(examination)
      return unless examination.head? && !@internal_head_examination_started
      @internal_head_examination_started = true
      @kaiken_count += 1
      subtitle = I18n.t('section_title.inner_head_title',
                        letter: @kaiken_count.to_full_width_letter)
      @html << content_tag(:h3, subtitle)
    end

    def insert_internal_torso_subtitle(examination)
      return unless examination.torso? && !@internal_torso_examination_started
      @internal_torso_examination_started = true
      @kaiken_count += 1
      subtitle = I18n.t('section_title.inner_torso_title',
                        letter: @kaiken_count.to_full_width_letter)
      @html << content_tag(:h3, subtitle)
    end

    def insert_examination_subsubtitle(examination)
      @section_count += 1
      subsubtitle = I18n.t('section_title.specific_examination_title',
                           number: @section_count,
                           title: examination.section_title)
      @html << content_tag(:h4, subsubtitle)
    end

    def insert_paragraph(object)
      begin
        paragraph = render(partial: object.partial_show_path,
                           locals: { exam: object.get })
      rescue
        # TODO: Print error and falls back to deprecated implementation.
        # Remove this begin/rescue when decorators are all implemented
        paragraph = content_tag(:div, "#{$ERROR_INFO} (no decorator support)",
                                style: 'color:red')
        paragraph << render(partial: object.partial_show_path,
                            locals: { exam: object.object.get })
      end
      @html << content_tag(:p, paragraph)
    end

    def add_analysis(analysis)
      insert_analysis_subtitle
      insert_analysis_subsubtitle(analysis)
      insert_paragraph(analysis)
      @html << analysis.note_description
    end

    def insert_analysis_subtitle
      return if @analyses_started
      @analyses_started = true
      @syoken_count += 1
      subtitle = I18n.t('section_title.subtitle',
                        title: I18n.t('section_title.analyses_title'),
                        number: @syoken_count.to_full_width)
      @html << content_tag(:h3, subtitle)
    end

    def insert_analysis_subsubtitle(analysis)
      @section_count += 1
      subsubtitle = I18n.t('section_title.specific_examination_title',
                           number: @section_count,
                           title: analysis.section_title)
      @html << content_tag(:h4, subsubtitle)
    end

    def render(*args)
      ApplicationController.render(*args)
    end
  end
end
