require 'nokogiri'
require 'open-uri'
require 'colorize'

namespace :executivo_federal do
  desc 'Raspa as diárias pagas em um ano e salva no banco'
  task :capturar_diarias  => :environment do
    tempo_inicio = Time.now
    puts "\n De que ano você quer analisar?"
    ano = STDIN.gets.chomp
    pag = 1
    pagMaxima = 2

    while pag < pagMaxima do
      url = "http://www.portaldatransparencia.gov.br/PortalComprasDiretasFavorecidosDiarias.asp?Ano="+ano+"&Pagina="+pag.to_s

      begin
        # Dá parse na página
        pagina = Nokogiri::HTML(open(url))
      rescue
        # Se o site estiver fora do ar, cairá neste erro
        puts 'Site indisponível'.red
        puts 'Tarefa cancelada :('.red
        puts "Duração: "+(Time.now-tempo_inicio).to_s+(" segundos")
        exit!
      else
        # Descobrir o número da última página
        # MatchData não tem o método to_i, então precisa converter para string antes
        pagMaxima = (/(?<=\d\/)\d+/).match(pagina.css(".paginaAtual").text).to_s.to_i

        i = 3
        while i < pagina.search("tr").count do
          diaria = DiariaPessoa.new
          diaria.orgao_superior = pagina.search("tr")[i].xpath("td")[0].text
          diaria.orgao = pagina.search("tr")[i].xpath("td")[1].text
          diaria.unidade_gestora = pagina.search("tr")[i].xpath("td")[2].text
          diaria.favorecido = pagina.search("tr")[i].xpath("td")[3].text
          diaria.valor = pagina.search("tr")[i].xpath("td")[4].text.to_s.tr('.', '').to_f
          p diaria
          diaria.save
          i = i + 1
        end

      end
      pag = pag + 1
    end
  end
end
