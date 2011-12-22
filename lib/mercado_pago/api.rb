module MercadoPago
  module API
    include HTTParty

    format :json
    base_uri "https://api.mercadolibre.com"
    headers "accept" => "application/json"
  end
end
