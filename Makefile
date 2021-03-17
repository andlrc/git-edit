all: git-drop git-reword git-drop.1 git-reword.1 README
.PHONY: all

clean:
	-rm git-drop.1
	-rm git-reword.1
	-rm git-drop
	-rm git-reword
.PHONY: clean

git-drop:
	ln -s git-edit git-drop

git-reword:
	ln -s git-edit git-reword

git-drop.1: git-edit.1
	ln -s git-edit.1 git-drop.1

git-reword.1: git-edit.1
	ln -s git-edit.1 git-reword.1

README:	git-edit.1
	man ./git-edit.1 | perl -pe 's/.\010//g' > README

install:
	cp git-edit $(PREFIX)/usr/local/bin/git-edit
	cp git-drop $(PREFIX)/usr/local/bin/git-drop
	cp git-reword $(PREFIX)/usr/local/bin/git-reword

	cp git-edit.1 $(PREFIX)/usr/local/share/man/man1/git-edit.1
	cp git-drop.1 $(PREFIX)/usr/local/share/man/man1/git-drop.1
	cp git-reword.1 $(PREFIX)/usr/local/share/man/man1/git-reword.1

.PHONY:	install
