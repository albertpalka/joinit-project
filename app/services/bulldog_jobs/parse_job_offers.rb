module BulldogJobs
  class ParseJobOffers
    RAW_DATA_MODEL = BulldogJobs::RawDatum.last

    def call
      jobs_body = RAW_DATA_MODEL.body
      body_parsed = parse(jobs_body)
      RAW_DATA_MODEL.parsed_offers.transaction do
        body_parsed.each do |job|
          job_hash = fetch_offer_body(job)
          RAW_DATA_MODEL.parsed_offers.create!(body: job_hash)
        end
      end
    end

    private

    def parse(jobs)
      JSON.parse(jobs)
    end

    def fetch_offer_body(offer_link)
      job_body = Nokogiri::HTML(open(offer_link))

      job_title = job_body.xpath("//div[@class='row offer-header leaf-header']/div/h1").text
      job_general_data = job_body.xpath("//ul[@class='list-unstyled list-colored list-inline list-inline--desktop']//li//span").map {|e| e.text}
      job_skills = job_body.xpath("//li[@class='job-technology']").map {|e| e.text.tr("\n","")}
      job_level = job_body.xpath("//strong[@class='text-primary']").text

      if job_general_data.count == 4
        {title: job_title,
         company: job_general_data[0],
         city: job_general_data[1],
         salary: job_general_data[2],
         contract: job_general_data[3],
         skills: job_skills,
         level: job_level,
         link: offer_link}
      else
        {title: job_title,
         company: job_general_data[0],
         city: job_general_data[1],
         salary: 0,
         contract: job_general_data[2],
         skills: job_skills,
         level: job_level,
         link: offer_link}
      end
    end
  end
end
