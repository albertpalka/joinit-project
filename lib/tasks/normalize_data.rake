desc 'Agregates and Normalizes data'
task :normalize_data => :environment do

  # FETCH JJIT
  JustJoinIt::FetchRawData.new.call
  JustJoinIt::ParseJobOffers.new.call

  # FETCH NOFLUFFJOOBS

  NoFluffJobs::FetchRawData.new.call
  NoFluffJobs::ParseJobOffers.new.call

  # FETCH BULLDOGJOB
  BulldogJobs::FetchRawData.new.call
  BulldogJobs::ParseJobOffers.new.call

  # NORMALIZE NEW DAILY DATA

  JustJoinIt::NormalizeJobs.new.call
  NoFluffJobs::NormalizeJobs.new.call
  BulldogJobs::NormalizeJobs.new.call

  # UPDATE OLD OFFERS STALE STATUS
  Offer.where("DATE(created_at) = ?", Date.today-1).update(stale: true)
end
