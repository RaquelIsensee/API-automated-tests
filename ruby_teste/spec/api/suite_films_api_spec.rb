require_relative '../lib/SwapiFimls.rb'

describe 'The Star Wars API - SWAPI', :swapi do

    context 'functional tests', :functional_tests do 
        it 'get list of all films' do
            result = SwapiFimls.get_all_films

            expect(result.response.code).to eql "200"
            expect(result.response.message). to eql "OK"
            expect(result.parsed_response["count"]). to eql 6
        
        end

        it 'get film by id' do
            result = SwapiFimls.get_film_by_id("1")

            expect(result.response.code).to eql "200"
            expect(result.response.message). to eql "OK"
            expect(result.parsed_response["title"]). to eql "A New Hope"
            expect(result.parsed_response["episode_id"]). to eql 4
            expect(result.parsed_response["director"]). to eql "George Lucas"
            expect(result.parsed_response["producer"]). to eql "Gary Kurtz, Rick McCallum"
            expect(result.parsed_response["release_date"]). to eql "1977-05-25"
        end

        it 'get film by title' do
            result = SwapiFimls.get_film_by_title("A New Hope")

            expect(result.response.code).to eql "200"
            expect(result.response.message). to eql "OK"
            expect(result.parsed_response["count"]). to eql 1

            expect(result.parsed_response["results"][0]["title"]). to eql "A New Hope"
            expect(result.parsed_response["results"][0]["episode_id"]). to eql 4
            expect(result.parsed_response["results"][0]["director"]). to eql "George Lucas"
            expect(result.parsed_response["results"][0]["producer"]). to eql "Gary Kurtz, Rick McCallum"
            expect(result.parsed_response["results"][0]["release_date"]). to eql "1977-05-25"
        end
    end

    context 'health check', :health_check do 
        it 'get api root endpoint' do
            result = SwapiFimls.get_api_root
    
            expect(result.response.code).to eql "200"
            expect(result.response.message). to eql "OK"        
        end

    end
    
    context 'validation tests', :validation_tests do 
            it 'get film by invalid id' do
                result = SwapiFimls.get_film_by_id("200")

                expect(result.response.code).to eql "404"
            end
    end
end