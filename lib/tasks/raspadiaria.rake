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

namespace :executivo_federal do
  desc 'Raspa as diárias pagas em um ano e salva no banco'
  task :capturar_diarias  => :environment do
    tempo_inicio = Time.now
    puts "\n De que ano você quer analisar?"
    ano = STDIN.gets.chomp
    pag = 1
    url = "http://www.portaldatransparencia.gov.br/PortalComprasDiretasFavorecidosDiarias.asp?Ano="+ano+"&Pagina="+pag.to_s

    puts 'Começando'
    begin
      # Utilizado pelo modo difícl
      # pagina = AGENTE.get(url)

      # Dá parse na página
      pagina = Nokogiri::HTML(open(url))
    rescue Mechanize::ResponseCodeError
      # Se o site estiver fora do ar, cairá neste erro
      puts 'Site indisponível'.red
      puts 'Tarefa cancelada :('.red
      puts "Duração: "+(Time.now-tempo_inicio).to_s+(" segundos")
      exit!
    else
      # Aqui vai nosso código ;)

      # Caso você queira pegar os nomes dos campos
      # Pode ser utilizado para criar o model
      cabecalho = []
      pagina.search("tr")[2].xpath("//th").each do |th|
        cabecalho << th.text
      end

      i = 3
      while i < pagina.search("tr").count do
        diaria = DiariaPessoa.new
        diaria.orgao_superior = pagina.search("tr")[i].xpath("td")[0].text
        diaria.orgao = pagina.search("tr")[i].xpath("td")[1].text
        diaria.unidade_gestora = pagina.search("tr")[i].xpath("td")[2].text
        diaria.favorecido = pagina.search("tr")[i].xpath("td")[3].text
        diaria.valor = pagina.search("tr")[i].xpath("td")[4].text
        p diaria
        i = i + 1
      end


      pagina = Nokogiri::HTML(open(url))

      pag = "2"

      i = 3
      while i < pagina.search("tr").count do
        diaria = DiariaPessoa.new
        diaria.orgao_superior = pagina.search("tr")[i].xpath("td")[0].text
        diaria.orgao = pagina.search("tr")[i].xpath("td")[1].text
        diaria.unidade_gestora = pagina.search("tr")[i].xpath("td")[2].text
        diaria.favorecido = pagina.search("tr")[i].xpath("td")[3].text
        diaria.valor = pagina.search("tr")[i].xpath("td")[4].text
        p diaria
        i = i + 1
      end

      puts "Duração: "+(Time.now-tempo_inicio).to_s+(" segundos")
    end



  end
end
