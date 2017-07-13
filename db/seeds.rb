# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

###################
## Msg for operator
def msg (txt, start=true)
  if start
    puts '=' * 120
    txt = "#{Time.now} --- #{txt} --- START"
    puts txt
    puts '-' * txt.length
  else
    txt = "#{Time.now} --- #{txt} --- FINISH"
    puts '-' * txt.length
    puts txt
  end
end

################################
## Push all yml file in database
dir = File.join Rails.root, 'db', 'seeds'
ext = '.yaml'
Dir.glob(File.join dir, "*#{ext}").select do |file|
  table = File.basename file, ext
  msg table
  table_class = table.to_s.classify.safe_constantize
  YAML.load_file(file).each do |key, enreg_yml|
    if enreg_yml.present?
      enreg_find = {enreg_yml.first[0] => enreg_yml.first[1]}
      enreg = table_class.find_by enreg_find
      if enreg.blank?
        puts enreg_yml
        enreg = table_class.create enreg_yml
        enreg.save!
        puts "ERROR : #{enreg.errors.messages.first}" unless enreg.save
      end
    end
  end
  msg table, false
end
