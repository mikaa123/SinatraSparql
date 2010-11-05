require 'rubygems'
require 'sinatra'
require 'SparqlTransmission'
require 'haml'
require 'uri'

get '/' do
  test = "coucou"
  haml :index
end

get '/results' do
  st = SparqlTransmission.new 'http://dbpedia.org/sparql'
  st.query = params[:query]
  st.execute_query
  
  var = {
    results:    st.results,
    variables:  st.requested_variables,
    total_res:  st.results.length,
    full_url:   "/results?query=#{URI.encode(params[:query])}&full=true",
    xml_url:    "/results.xml?query=#{URI.encode(params[:query])}"
  }
  haml :index, :locals => {:var => var}
end