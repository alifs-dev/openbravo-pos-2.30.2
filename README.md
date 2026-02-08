== Openbravo POS 2.30.2  ==

Openbravo POS is a point of sale application designed for touch screens, supports ESC/POS ticket printers, customer displays and barcode scanners. It is multiuser providing product entry forms, reports and charts.

You can read the release notes of this version in the following link http://wiki.openbravo.com/wiki/Openbravo_POS_2.30.2_Release_notes

* Installation

To install Openbravo POS read the installation instructions that have been published in the following link http://wiki.openbravo.com/wiki/OpenbravoPOS_Installation

* The latest version

The latest version can be found on the Openbravo POS sourceforge web site http://sourceforge.net/project/showfiles.php?group_id=127939

* Documentation

See http://wiki.openbravo.com for more documentation.

* Forums

If you need help or want to collaborate helping others, sharing ideas, discussing about Openbravo POS, feel free to go to our forums http://sourceforge.net/forum/?group_id=127939

* Helping out

If you'd like to help out, great!
Have a look to the Openbravo POS contributor's guide: http://wiki.openbravo.com/wiki/OpenbravoPOS_Contributor%27s_Guide

Please share your changes so others can benefit.

Please use svn diff to prepare patches.

* Contact

IRC: #openbravo in freenode

## Update functionnalities

### Java 21 support

```
add symlink : jdt-compiler-3.1.1.jar -> ecj-3.36.0.jar
remove old: jdt-compiler-3.1.1.jar
```

### add json config file support:

Shop.Properties.txt: 
```
{
  "name": "Shop Demo",
  "adresse": "1 rue des lilas"
  "adresse2": "75000 Paris"
  "afficheur": "Shop Demo, bonjour, des nouveautés tous les jours et des promo toutes l'année"
}
```

#### Config use:
add this to *.jrxml file:
```
  <parameter name="SHOP" class="org.json.simple.JSONObject"/>
  ....
  <textFieldExpression class="java.lang.String"><![CDATA[$P{SHOP}.get("name")]]></textFieldExpression>
```

or in ticket file (ex. Printer.Ticket)
```
  <output>
      <display animation="scroll">
          <line>
              // <text type="json" resource="${Resource file}$">{json key}</text>
              <text type="json" resource="Shop.Properties">afficheur</text>
          </line>
          <line>
              <text>Bonjour</text>
          </line>
      </display>
  </output>

```
#### add default local 
- jcboCurrency.addItem("#0.00 " + currencySymbol);
- jcboCurrency.addItem(currencySymbol + " #,##0.00");

### deprecated changes
- snew Double(ticket.getLine(i).getMultiply()),
- Double.valueOf(ticket.getLine(i).getMultiply()),

#### moved files in config folder:
* openbravopos.properties
* derby database files

#### remove old files

* remove of getty
* remove old sql files
* replace coin images in currency folder
...
