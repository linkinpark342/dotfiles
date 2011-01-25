all: $(HOME)/.vim \
	$(HOME)/.vimrc \
	vim/colors/inkpot.vim \
	vim/doc/surround.txt \
	vim/plugin/surround.vim \
	$(HOME)/.dir_colors \
	$(HOME)/.gitconfig \
	$(HOME)/.gvimrc \
	$(HOME)/.htoprc \
	$(HOME)/.mrxvtrc \
	$(HOME)/.screenrc \
	$(HOME)/.ssh/config\
	$(HOME)/.wmiirc \
	$(HOME)/.Xdefaults \
	$(HOME)/.Xmodmap \
	$(HOME)/.zshenv \
	$(HOME)/.zshrc

$(HOME)/.%: %
	ln -fs $(abspath $<) $@

$(HOME)/.ssh/config: ssh_config
	mkdir -p $(HOME)/.ssh
	ln -fs $(abspath $<) $@

vim/inkpot.vim: inkpot/colors/inkpot.vim
	ln -fs $(abspath $<) $@

vim/doc/surround.txt: vim-surround/doc/surround.txt
	ln -fs $(abspath $<) $@

vim/plugin/surround.txt: vim-surround/plugin/surround.txt
	ln -fs $(abspath $<) $@


vim-surround/doc/surround.txt vim-surround/plugin/surround.vim inkpot/colors/inkpot.vim:
	git submodule init
	git submodule update
