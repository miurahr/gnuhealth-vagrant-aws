require 'rexml/document'
require 'gdbm'


#
## test data
#
xml=  <<EOL
<?xml version="1.0" encoding="utf-8" ?>
<tryton>
<data skiptest="1" noupdate="1">
<record model="gnuhealth.pathology" id="A00">
	<field name="name">Cholera</field>
  <field name="code">A00</field>
  <field name="category" ref="icdcat1-1"></field>
</record>

<record model="gnuhealth.pathology" id="A000">
  <field name="name">Cholera due to Vibrio cholerae 01, biovar cholerae</field>
  <field name="code">A00.0</field>
	<field name="category" ref="icdcat1-1"></field>
</record>
<record model="gnuhealth.pathology" id="E100">
	<field name="name">With coma</field>
	<field name="code">E10.0</field>
	<field name="category" ref="icdcat4-2"></field>
</record>
</data>
</tryton>
EOL
#
# translation file
#"0","20050004","１８常染色体異常","１８ジョウセンショクタイイジョウ","1","L21F","Q913","","S","Q913","7582002","１８常染色体異常","1","200","","","00","0"
# translated into gdbm  file nmain314.db
#

# output TMX file
#
tmx_header = <<HEADER
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE tmx SYSTEM "tmx11.dtd">
<tmx version="1.1">
  <header creationtool="diseases trans" o-tmf="OmegaT TMX" adminlang="EN-US" datatype="plaintext" creationtoolversion="0.1" segtype="sentence" srclang="EN-US"/>
  <body>
HEADER

tmx_tailer = <<TAILER
  </body>
</tmx>
TAILER

source = REXML::Document.new(open("diseases.xml"))
# for test
#source = REXML::Document.new(xml)
#
trans  = GDBM.open("nmain314.db")
target = File.new("diseases.tmx","w")

target.write(tmx_header)

source.elements.each('//data/record') do |rec|
  code = rec.attributes["id"]
  name = rec.elements['field[@name="name"]'].text
  jpn = trans[code]
  if jpn != ""
    target.write("<!-- Code: #{code} -->\n")
    target.write("<tu><tuv lang='EN-US'><seg>#{name}</seg></tuv>\n")
    target.write("<tuv lang='JA'><seg>#{jpn}</seg></tuv></tu>\n")
  end
end

target.write(tmx_tailer)

target.close
trans.close
