all: git-rebase-drop git-rebase-drop.1 README
.PHONY: all

clean:
	-rm git-rebase-drop.1
	-rm git-rebase-drop
.PHONY: clean

git-rebase-drop:
	ln -s git-rebase-edit git-rebase-drop

git-rebase-drop.1: git-rebase-edit.1
	ln -s git-rebase-edit.1 git-rebase-drop.1

README:	git-rebase-edit.1
	man ./git-rebase-edit.1 | perl -pe 's/.\010//g' > README

install:
	cp git-rebase-edit $(PREFIX)/usr/local/bin/git-rebase-edit
	cp git-rebase-drop $(PREFIX)/usr/local/bin/git-rebase-drop

	cp git-rebase-edit.1 $(PREFIX)/usr/local/share/man/man1/git-rebase-edit.1
	cp git-rebase-drop.1 $(PREFIX)/usr/local/share/man/man1/git-rebase-drop.1

.PHONY:	install
