#language: pt
  
##https://corona.lmao.ninja/v2/countries/:query?yesterday&strict&query
  Dado("que acesso um endpoint") do
    @endereco = 'https://disease.sh/v3/covid-19/countries/Brasil?strict=true'
  end
  
  Quando("realizar uma requisição GET") do
    @retorno = HTTParty.get @endereco
  end
   
  Entao("validar o contrato através de um schema") do
    expect(@retorno.body).to match_json_schema('schema')
  end