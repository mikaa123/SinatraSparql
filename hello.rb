require 'rubygems'
require 'sinatra'
require 'SparqlTransmission'

get '/' do
  "Hello from Sinatra on Heroku!"
  sq = SparqlTransmission.new 'http://dbpedia.org/sparql'
  sq.query = "SELECT ?subject 
  WHERE 
  {

   ?subject <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://dbpedia.org/ontology/Person>

  }"
  
  puts sq.execute_query
end