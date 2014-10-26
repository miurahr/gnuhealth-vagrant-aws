ICD10 translation memory generator
-------------------------------


Here is an utility to generate TMX (translate memory exchange) file
to help JA translator to use OmegaT and standard name.

A source is http://www2.medis.or.jp/stdcd/byomei/index.html
ICD10 対応標準病名マスター

You need to install ruby for generation.

Prerequisite
-------------

You need some utilities.

* unzip
* wget
* ruby

You also need internet connection


How to
-----

Run `build.sh`

It download master table and generate nmain314.db
and generate diseases.tmx from diseases.xml and nmain314.db

Details
-----------

* nmain-gdbm.rb generate nmain314.db
  that has a table mapping with ICD code and its Japanese name. 

* diseases-trans.rb 
  make TMX file from diseases.xml that is distributed with 
  GNU Health ICD10 module.
  This script use nmain314.db to look up Japanese terms.


How to use OmegaT
--------------------

* install OmegaT (from oemgat.org or distribution package)

* start OmegaT

* create project directory from OmegaT

* copy `diseases.tmx` onto OmegaT project directory proj/tm/

* Download PO file for ICD10 from Transifex project

* Place po file to OmegaT project directory proj/source/

* Restart OmegaT

* Enjoy translation

* Generate target file

* Upload result file to Transifex
