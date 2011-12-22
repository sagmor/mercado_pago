module MercadoPago
  module Payment
    class Notification < Hashie::Clash
      attr_accessor :client

      def self.find(client, id)
        response = API.get("/collections/notifications/#{id}", {
          :query => {
            :access_token => client.access_token
          }
        })

        notification = self.new(response["collection"])
        notification.client = client
        notification
      end
    end
  end
end

