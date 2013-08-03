module FellowshipOne

  class ContributionListReader < ApiReader

    # Constructor.
    #
    # Options:
    # :page - (optional) The page number to get.  The default is 1.
    # :per_page - (optional) The number of items to return per page.
    # :start_date - (optional) search for receipts with a received date greater than or equal to this parameter.
    # :end_date - (optional) search for receipts with a received date less than or equal to this parameter. Must be used in conjunction with startReceivedDate.
    def initialize(options = {})
      page = options[:page] || 1
      per_page = options[:per_page] || 500

      @url_data_params = {}
      @url_data_path = options[:start_date].nil? ? '/giving/v1/contributionreceipts' : '/giving/v1/contributionreceipts/search'
            
      @url_data_params.merge!({:page => page}) if page
      @url_data_params.merge!({:recordsPerPage => per_page}) if per_page
      @url_data_params.merge!({:startReceivedDate => options[:start_date]}) if options[:start_date]
      @url_data_params.merge!({:endReceivedDate => options[:end_date]}) if options[:end_date]
    end

  end

end