"!/home/scp1/bin/wim --remote-wait-silent vimsy
" vim: fdm=marker:fmr="<,">:fen:et:sw=2:smc=80:
"
" ${VIMRUNTIME}/nancy/000-ft.vim
"   ‗‗‗‗‗‗‗‗‗‗‗‗ ‗‗‗‗‗‗ ‗‗‗‗‗‗‗‗ ‗‗‗‗‗‗‗‗‗‗‗
"         owner  Magnus Woldrich <m@japh.se>
"         btime  2009-04-24
"         mtime  2013-01-14 22:01:26
"         perms  You are free to use things you may find useful here.
"                Would my tweaks happen to give you a raise or fetch you a
"                girlfriend, it goes without saying I'm counting on you
"                to share with me as I've shared with you.
"           git  git@github.com:trapd00r/configs.git
"           url  http://github.com/trapd00r/configs/vim
"           irc  japh@freenode #vim #zsh #perl
"   ‗‗‗‗‗‗‗‗‗‗‗‗ ‗‗‗‗‗‗‗‗‗‗‗‗‗ ‗‗‗‗ ‗‗‗‗ ‗‗‗‗
"

filetype plugin indent on

let g:VimrexFileDir                = expand("~/") . 'var/vim/'
let g:c_comment_strings            = 1
let g:c_gnu                        = 1
let g:c_space_errors               = 1
let g:c_syntax_for_h               = 1
let g:dircolors_is_slackware       = 1
let g:extradite_width              = 40
let g:highlight_sedtabs            = 1
let g:indent_guides_auto           = 0
let g:lua_subversion               = 0
let g:lua_version                  = 5
let g:mpc_lyrics_use_cache         = 1
let g:mpd_host                     = '192.168.1.18'
let g:mpd_port                     = 6600
let g:netrw_http_cmd               = 'wget'
let g:netrw_http_xcmd              = '-q -O'
let g:perl_compiler_force_warnings = 0
let g:perl_extended_vars           = 1
let g:perl_include_pod             = 1
let g:perl_moose_stuff             = 1
let g:perl_no_scope_in_variables   = 1
let g:perl_no_sync_on_global_var   = 1
let g:perl_no_sync_on_sub          = 1
let g:perl_nofold_packages         = 1
let g:perl_pod_formatting          = 1
let g:perl_pod_spellcheck_headings = 1
let g:perl_string_as_statement     = 1
let g:perl_sync_dist               = 1000
let g:perl_want_scope_in_variables = 1
let g:perlhelp_prog                = '/usr/bin/perldoc'
let g:readline_has_bash            = 1
let g:sh_fold_enabled              = 4
let g:sh_is_posix                  = 1
let g:sh_maxlines                  = 200
let g:sh_minlines                  = 100
let g:space_no_jump                = 1
let g:tex_conceal                  = 1
let g:vim_indent_cont              = 2
let g:vimsyn_embed                 = 'p'
let g:vimsyn_folding               = 'afp'
let g:vt_author                    = 'Magnus Woldrich'
let g:vt_email                     = 'm@japh.se'
let g:vt_template_dir_path         = '~/etc/vim/templates/'
let g:xclipboard_pipe_path         = '/home/scp1/etc/vim/xclipboard.fifo'
let g:xf86conf_xfree86_versio      = 2

set formatoptions=qro
set formatprg=perl\ -MText::Autoformat\ -e'autoformat'

au BufWrite           ~/.irssi/scripts/*.pl  %s/changed     => ["'].*/\="changed     => '" . strftime("%c") . "',"/e
au BufWrite           ~/.irssi/*             %s/changed     => ["'].*/\="changed     => '" . strftime("%c") . "',"/e
au BufRead            ~/etc/feh/keys         call Filetype_feh()
au BufRead            /etc/fstab,~/etc/fstab hi fsDeviceError ctermfg=fg ctermbg=bg cterm=italic
au BufRead,BufNewFile *.overtime             setl ft=overtime
au BufRead,BufNewFile *.*htm*,*.xml          setl sw=1
au BufRead,BufNewFile *.go                   setl ft=go
au BufRead,BufNewFile *.css                  setl sw=2
au BufNewFile         *.txt                  setl cc=
au Filetype           gitcommit              call ToggleSpell()
au Filetype           help                   call Filetype_Help()

au BufNewFile         *.vim                  silent! 0r $VIMRUNTIME/templates/template.vim
au BufNewFile         *.c                    silent! 0r $VIMRUNTIME/templates/template.c

"< highlight trailing whitespace
"    when not typing on the current line
"    when we open new buffers
"  and conceal it if 'cole is set
syn match wsEOL /\s\+$/ conceal cchar=♥
highlight wsEOL cterm=bolditalicunderline ctermfg=196 ctermbg=233
autocmd BufWinEnter   * match wsEOL /\s\+$/
autocmd InsertEnter   * match wsEOL /\s\+\%#\@<!$/
autocmd InsertLeave   * match wsEOL /\s\+$/
autocmd BufWinLeave   * call clearmatches()
">

au Filetype perl
  \   setl makeprg=perl\ -c\ %\ $*
  \ | setl errorformat=%f:%l:%m
  \ | setl keywordprg=perldoc\ -f
au BufNewFile *.pl
  \   silent! 0r $VIMRUNTIME/templates/template.pl
  \ | call search('APP')
  \ | normal di':startinsert
au BufNewFile *.PL
  \   silent! 0r ~/etc/vim/templates/template.PL
  \ | call search('__PACKAGE__')
  \ | exe 'normal dt} '
  \ | startinsert
au BufNewFile *.pm
  \   silent! 0r $VIMRUNTIME/templates/template.pm
  \ | call cursor(0, 9)
  \ | exe 'normal d$A '
  \ | startinsert
au BufNewFile *.t
  \   silent! 0r $VIMRUNTIME/templates/template.t
  \ | 6
  \ | exe 'normal o'
  \ | startinsert
au BufNewFile *.md,*.markdown
  \   silent! 0r $VIMRUNTIME/templates/template.md
  \ | 0
  \ | exe 'normal d$A'
  \ | startinsert

augroup FastEscape
  autocmd!
  set notimeout
  set ttimeout
  set timeoutlen=10
  au InsertEnter * set timeout
  au InsertLeave * set notimeout
augroup END

func! Filetype_Help()
  setl colorcolumn=0
  setl listchars=tab:\ \
  setl bufhidden=unload
endfunc

func! Filetype_feh()
  syn match feh_action '\v^\w+' nextgroup=feh_keys skipwhite
  syn match feh_keys   '\v.+'   contained
  hi feh_action ctermfg=202
  hi feh_keys   ctermfg=106
endfunc
