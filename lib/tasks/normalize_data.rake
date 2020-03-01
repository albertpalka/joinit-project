desc 'Agregates and Normalizes data'
task :normalize_data => :environment do
  # FETCH JJIT
  puts "Start JJIT"
  JustJoinIt::FetchRawData.new.call
  puts "Start JJIT Parsing"
  JustJoinIt::ParseJobOffers.new.call

  # FETCH NOFLUFFJOOBS

  puts "Start Fluff"
  NoFluffJobs::FetchRawData.new.call
  puts "Start Fluff Parse"
  NoFluffJobs::ParseJobOffers.new.call

  # FETCH BULLDOGJOB
  puts "Start Bulldog"
  BulldogJobs::FetchRawData.new.call
  puts "Start Bulldog Parse"
  BulldogJobs::ParseJobOffers.new.call

  # NORMALIZE NEW DAILY DATA
  puts "normalize JJIT"
  JustJoinIt::NormalizeJobs.new.call
  puts "normalize Fluff"
  NoFluffJobs::NormalizeJobs.new.call
  puts "normalize Bulldog"
  BulldogJobs::NormalizeJobs.new.call

  # UPDATE OLD OFFERS STALE STATUS
  puts "Update stale status"
  Offer.where("DATE(created_at) = ?", Date.today-1).update(stale: true)
end
