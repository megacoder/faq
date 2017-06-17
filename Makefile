.SUFFIXES:
.SUFFIXES: .html .xml .xsl .dtd

%.html:	%.xml
	xsltproc -o $@ $*.xsl $*.xml

all:	faq.html

faq.html: faq.xml faq.xsl faq.dtd

clean:

show:	faq.html
	cat faq.html

view:	faq.html
	htmlview faq.html

distclean clobber: clean
	${RM} faq.html
