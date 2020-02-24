# frozen_string_literal: true

require 'open-uri'

module BulldogJobs
  # Fetches Raw Data from main offers page. Example: https://bulldogjob.com/companies/jobs?page=1

  # n.xpath("//ul[@class='results-list list-unstyled content']//li//a//@href").map(&:value)
  class FetchRawData
    START_PAGE = 'https://bulldogjob.com/companies/jobs'
    MODEL = BulldogJobs::RawDatum

    def call
      jobs_pages = fetch_jobs_pages(START_PAGE)
      jobs_links = fetch_jobs_links(jobs_pages)
      MODEL.create!(body: jobs_links.to_s)
    end

    private

    def fetch_jobs_pages(page)
      page_body = Nokogiri::HTML(open(START_PAGE))

      # We only receive slugs here: /companies/jobs?mode=searchbar&page=2
      page_body.xpath("//ul[@class='pagination']//li//a//@href").map(&:value)
    end

    def fetch_jobs_links(pages)
      links = []
      pages.each do |jobs_link|
        page = "https://bulldogjob.com#{jobs_link}"
        raw_body = Nokogiri::HTML(open(page))
        links << raw_body.xpath("//ul[@class='results-list list-unstyled content']//li//a//@href").map(&:value)
      end

      links.flatten.uniq.delete_if { |x| x == "#subscribeModal" }
    end
  end
end
