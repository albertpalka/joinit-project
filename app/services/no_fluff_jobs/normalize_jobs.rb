module NoFluffJobs
  class NormalizeJobs
    # MODEL = NoFluffJobs::RawDatum.last.parsed_offers

    def call
      MODEL.each do |raw_offer|
        offer_body = raw_offer.body

        if offer_body['essentials']['salary']['currency'] != 'PLN'
          salary = ""
        else
          salary = "#{offer_body['essentials']['salary']['types'].first[1]['range'][0]} - #{offer_body['essentials']['salary']['types'].first[1]['range'][1]}"
        end

        Offer.create!( company: offer_body['company']['name'],
                       title: offer_body['title'],
                       link: "https://nofluffjobs.com/job/#{offer_body['id']}",
                       city: "#{offer_body['location']['places'].map{ |e| e['city'] }.join(', ')}",
                       salary: salary,
                       job_board: 'NoFluffJobs')
      end
    end
  end
end
