class ExternalEarExaminationsDecorator < ApplicationCollectionDecorator
  include DualObjectDecoratorHelper

  def description
    if no_issue?
      t('.no_issue')
    else
      sentences = []
      sentences << left.description if left.present?
      sentences << right.description if right.present?
      h.join_sentences(sentences)
    end
  end

  private

  def no_issue?
    left.present? && right.present? && left.no_injury? && right.no_injury? &&
      !right.bleeding? && !left.bleeding?
  end
end
