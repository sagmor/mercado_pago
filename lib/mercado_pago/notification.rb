module MercadoPago
  class Notification < Hashie::Clash
    attr_accessor :client

    def self.find(client, id)
      response = API.get("/collections/notifications/#{id}", {
        :query => {
          :access_token => client.access_token
        }
      })

      raise NotificationNotFoundError unless response["collection"]

      notification = self.new(response["collection"])
      notification.client = client
      notification
    end
  end

  class NotificationNotFoundError < RuntimeError; end
end
