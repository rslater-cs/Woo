module Daily
    class Client
        def initialize
            @host = 'api.daily.co/v1'
            @key = 'a911ee28582995cc96b554b317c020b44dff7d2ca0a39fce7cad9bad25912760'
        end

        def create_new_room(name)
            get('rooms', 'POST', name)
        end

        def delete_room(name)
            get('rooms/' + name, 'DELETE')
        end

        def check_room(name)
            response = get('rooms/' + name) 
        end

        def get(path, method = 'GET', name = '')
            require 'uri'
            require 'net/http'
            require 'openssl'

            url = URI('https://' + @host + '/' + path)

            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true

            if method == 'POST'
                request = Net::HTTP::Post.new(url)
            elsif method == 'GET'
                request = Net::HTTP::Get.new(url)
            elsif method == 'DELETE'
                request = Net::HTTP::Delete.new(url)
            end

            request["Content-Type"] = 'application/json'
            request["Authorization"] = 'Bearer ' + @key

            request.body = "{\"properties\":{\"enable_chat\":true},\"name\":\"#{name}\"}"

            response = http.request(request)

            puts response.body
            
            return response
        end
    end
end