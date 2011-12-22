module MercadoPago
  module Payment
    class Preference < Hashie::Dash
      attr_accessor :client
      
      # Configurables
      property :collector_id
      property :external_reference
      property :items, :required => true
      property :payer
      property :back_urls
      property :payment_methods

      # Properties
      property :id
      property :init_point
      property :sponsor_id
      property :additional_info
      property :date_created
      property :subscription_plan_id
      property :expires
      property :expiration_date_to
      property :expiration_date_from
      property :payer

      def initialize(attributes)
        self.attributes = attributes
        super()
      end

      def attributes=(attributes)
        attributes.each do |key,value|
          self.send "#{key}=", value
        end
      end

      def item=(item)
        self.items = [item]
      end

      def items=(items)
        self[:items] = (items || []).map{ |i| Item.new(i) }
      end

      def url
        init_point
      end

      def date_created=(date_created)
        self[:date_created] = Time.parse(date_created) rescue nil
      end

      def new?
        id.nil?
      end

      def valid?
        items && items.length > 0
      end

      def save
        valid? && ( new? ? create : update )
      end

      def to_json(*args)
        MultiJson.encode(as_json)
      end

      def as_json(*args)
        hash = {
          :items => items,
        }

        hash[:external_reference] = external_reference if external_reference
        hash[:payer] = payer if payer
        hash[:back_urls] = back_urls if back_urls
        hash[:payment_methods] = payment_methods if payment_methods

        hash
      end

      def self.find(client, id)
        response = API.get("/checkout/preferences/#{id}", {
          :query => {
            :access_token => client.access_token
          }
        })

        notification = self.new(response["collection"])
        notification.client = client
        notification
      end

      protected
        def create
          response = API.post("/checkout/preferences", {
            :body => to_json,
            :query => {
              :access_token => client.access_token
            },
            :headers => {
              "content-type" => "application/json"
            }
          })
          self.attributes = response
          true
        rescue
          raise response.inspect
        end

        def update
          # TODO
          false
        end
    end
  end
end
