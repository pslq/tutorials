compile:
	test -f style.css ||  wget -O style.css http://b.enjam.info/panam/styling.css
	#test -f style.css || wget -O style.css https://raw.githubusercontent.com/sindresorhus/github-markdown-css/main/github-markdown.css
	for i in *.md ; do pandoc  -f markdown --css style.css --self-contained  -t html5 -V fontsize=4pt $$i -o `basename $$i .md`.html ; done
	for i in *.md ; do pandoc  -f markdown --css style.css --self-contained  --highlight-style zenburn  -V geometry:margin=0.5cm -t pdf -V fontsize=4pt $$i -o `basename $$i .md`.pdf ; done

clean:
	rm -f *.html *.pdf

