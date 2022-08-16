require 'yaml'

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

def solucao items:, formats_path:
  formats = YAML.load_file formats_path

  items.map { |item|
    formats.keys.map! {|key|

      length = formats[key]['length']
      align = formats[key]['align'][0]
      padding = { spaces: ' ', zeroes: '0' }[formats[key]['padding'].to_sym]

      item[key.to_sym][0...length].send("#{align}just", length, padding)

    }.join
  }.join("\n")
end

p solucao(items: input, formats_path: 'app/format_01.yaml') == "97905796671Maria Neusa de00001234\n44010762900Ricardo Fontes00000567"
p solucao(items: input, formats_path: 'app/format_02.yaml') == "0009790579667100001234Sao Paulo     \n0004401076290000000567Rio Grande do "
