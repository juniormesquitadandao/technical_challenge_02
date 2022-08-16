input = [
  {
    name: 'Maria Neusa de Aparecida',
    cpf: '97905796671',
    state: 'Sao Paulo',
    value: '1234'
  },
  {
    name: 'Ricardo Fontes',
    cpf: '44010762900',
    state: 'Rio Grande do Sul',
    value: '567'
  }
]

def solucao items
  items.map { |item|
    %i[name cpf state value].map!{|key| item[key][0...11].ljust(11, ' ')}.join
  }.join("\n")
end

p solucao(input) == "Maria Neusa97905796671Sao Paulo  1234       \nRicardo Fon44010762900Rio Grande 567        "
