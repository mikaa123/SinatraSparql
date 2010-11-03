require 'rubygems'
require 'sinatra'
require 'SparqlTransmission'

get '/' do
  sq = SparqlTransmission.new 'http://dbpedia.org/sparql'
  sq.query = "SELECT ?subject 
  WHERE 
  {

   ?subject <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://dbpedia.org/ontology/Person>

  }"
  
  sq.execute_query
  #puts sq.execute_query
end