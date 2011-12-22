module MercadoPago
  module Payment
    class Item < Hashie::Dash
      property :id
      property :title, :required => true
      property :quantity, :required => true, :default => 1
      property :unit_price, :required => true
      property :currency_id, :required => true
      property :picture_url
      property :description

      def to_json(*args)
        MultiJson.encode(as_json)
      end

      def as_json(*args)
        hash = {
		      :title => title,
		      :quantity => quantity,
		      :unit_price => unit_price,
		      :currency_id => currency_id
        }

        # optional attributes
		    hash[:id] = id if id
		    hash[:picture_url] = picture_url if picture_url
        hash[:description] = description if description

        hash
      end
    end
  end
end
