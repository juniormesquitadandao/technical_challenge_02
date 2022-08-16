require 'yaml'

def solucao data:, formats_path:
  formats = YAML.load_file formats_path

  formats.keys.reduce({}) {|item, key|
    length = formats[key]['length']
    align = formats[key]['align'][0]
    padding = { spaces: ' ', zeroes: '0' }[formats[key]['padding'].to_sym]

    regex = Regexp.new({ l: "#{padding}+$", r: "^#{padding}+" }[align.to_sym])

    item.merge! key.to_sym => data.slice!(0...length).gsub(regex, '')
  }
end

p solucao(data: "97905796671Maria Neusa de00001234", formats_path: 'app/format_01.yaml') == { cpf: '97905796671', name: 'Maria Neusa de', value: '1234' }
p solucao(data: "44010762900Ricardo Fontes00000567", formats_path: 'app/format_01.yaml') == { cpf: '44010762900', name: 'Ricardo Fontes', value: '567' }
p solucao(data: "0009790579667100001234Sao Paulo     ", formats_path: 'app/format_02.yaml') == { cpf: '97905796671', value: '1234', state: 'Sao Paulo' }
p solucao(data: "0004401076290000000567Rio Grande do ", formats_path: 'app/format_02.yaml') == { cpf: '44010762900', value: '567', state: 'Rio Grande do' }
