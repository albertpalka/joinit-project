module JustJoinIt
  class NormalizeJobs
    # MODEL = JustJoinIt::RawDatum.last.parsed_offers

    def call
      MODEL.each do |raw_offer|
        offer_body = raw_offer.body

        if offer_body['salary_from'] == nil || offer_body['salary_from'] == 0
          salary = ""
        else
          salary = "#{offer_body['salary_from']} - #{offer_body['salary_to']}"
        end

        Offer.create!( company: offer_body['company_name'],
                       title: offer_body['title'],
                       link: "https://justjoin.it/offers/#{offer_body['id']}",
                       city: offer_body['city'],
                       salary: salary,
                       job_board: 'JustJoin.IT')
      end
    end
  end
end
