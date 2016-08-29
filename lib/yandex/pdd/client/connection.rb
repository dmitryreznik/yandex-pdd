module Yandex
  module Pdd
    class Client
      module Connection

        def get(path, options = {})
          request :get, path, options
        end

        def post(path, options = {})
          request :post, path, options
        end

        def put(path, options = {})
          request :put, path, options
        end

        def patch(path, options = {})
          request :patch, path, options
        end

        def delete(path, options = {})
          request :delete, path, options
        end

        private
        def request(http_method, path, options)
          response = self.class.send(http_method, path, {query: options})
          data = response.parsed_response

          JSON.parse(data)
        end

      end
    end
  end
end