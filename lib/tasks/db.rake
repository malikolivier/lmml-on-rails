namespace :db do
  desc 'Reset all relation counters according to the value in the database'
  task reset_counters: :environment do
    Person.find_each do |person|
      Person.reset_counters(person.id, :autopsies_examiners)
      Person.reset_counters(person.id, :autopsies_suspects)
      Person.reset_counters(person.id, :autopsies_victims)
      Person.reset_counters(person.id, :autopsies_police_inspectors)
      Person.reset_counters(person.id, :autopsies_judges)
    end
    Institution.find_each do |i|
      Institution.reset_counters(i.id, :autopsies_places)
      Institution.reset_counters(i.id, :autopsies_police_stations)
      Institution.reset_counters(i.id, :autopsies_courts)
    end
  end

  desc 'Clean the database by dropping it and running all the migrations'
  task clean: :environment do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:fixtures:load'].invoke
    Rake::Task['db:reset_counters'].invoke
  end
end
