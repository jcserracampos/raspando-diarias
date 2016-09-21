require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'mechanize'
require 'colorize'

AGENTE = Mechanize.new do |a|
  a.follow_meta_refresh = true
  a.agent.http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  # Para evitar problemar com SSL
  # Mechanize deixa as conexões abertas e confia no coletor de lixo para limpá-las
  # Depois de um certo ponto, existem tantas conexões abertas que nenhuma conexão de saída pode ser estabelecida
  # TODO: Fechar as conexões depois de usá-las
end
