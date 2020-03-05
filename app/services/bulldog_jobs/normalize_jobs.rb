module BulldogJobs
  class NormalizeJobs
    MODEL = BulldogJobs::RawDatum.last.parsed_offers

    def call
      MODEL.each do |raw_offer|
        offer_body = raw_offer.body

       if offer_body['salary'] != 0
         salary = offer_body['salary'].gsub("\n","").sub /[^0]+$/, ''
       else
         salary = ''
       end

        Offer.create!( company: offer_body['company'],
                       title: offer_body['title'],
                       link: "#{offer_body['link']}",
                       city: offer_body['city'],
                       salary: salary,
                       job_board: 'BulldogJob')
      end
    end
  end
end
