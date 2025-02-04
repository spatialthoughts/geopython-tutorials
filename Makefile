html:
	jupyter-book build .
	cp CNAME _build/html
	
gh-pages: html
	ghp-import -n -p -f _build/html