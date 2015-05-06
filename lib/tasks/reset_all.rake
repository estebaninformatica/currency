namespace :reset do
 task  all: :environment do
   Rake::Task["db:drop"].invoke
   Rake::Task["db:create"].invoke
   Rake::Task["db:migrate"].invoke
   Rake::Task["load:moneys"].invoke
 end
end