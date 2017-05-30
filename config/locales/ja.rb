{
  ja: {
    i18n: {
      plural: {
        keys: %i[zero other],
        rule: lambda do |n|
          n.zero? ? :zero : :other
        end
      }
    }
  }
}
