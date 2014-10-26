require 'rexml/document'
require 'gdbm'

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

# translation file
#"0","20050004","１８常染色体異常","１８ジョウセンショクタイイジョウ","1","L21F","Q913","","S","Q913","7582002","１８常染色体異常","1","200","","","00","0"
# translated into gdbm  file nmain314.db
#

#source = REXML::Document.new(open("diseases.xml"))
source = REXML::Document.new(xml)
trans  = GDBM.open("nmain314.db")

source.elements.each('//data/record') do |rec|
  code = rec.attributes["id"]
  name = rec.elements['field[@name="name"]'].text
  jpn = trans[code]
  p code
  p name
  p jpn
  p "\n"
end
