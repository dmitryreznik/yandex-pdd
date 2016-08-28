require 'yandex/pdd/client/connection'

require 'yandex/pdd/client/domains'
require 'yandex/pdd/client/mailboxes'

module Yandex
  module Pdd
    include HTTParty
    include Yandex::Pdd::Client::Domains
    include Yandex::Pdd::Client::Mailboxes

    base_uri 'https://pddimp.yandex.ru'
    format :json

    def initialize(token = nil)
      @token = token || ENV['PDD_TOKEN']

      self.class.default_options.merge!(headers: {:PddToken => @token})
    end
  end
end