syntax on
filetype indent on
filetype plugin on
filetype plugin indent on
set number
set cursorline
set wrap

set wildmenu
set ignorecase
set cursorline "有一根线表示在第几行
set scrolloff=3 "光标的位置在第五行
set showcmd
set smartcase
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set tabstop=2 "tab键自动缩进2字符
"实现多终端内容剪切并且支持触控板滚动
set clipboard=unnamed
set mouse=nicr
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>

noremap J 10j
noremap K 10k
noremap = nzz
noremap - Nzz

map sl :set splitright<CR>:vsplit<CR>
map sr :set nosplitright<CR>:vsplit<CR>
map su :set nosplitbelow<CR>:split<CR>
map sd :set splitbelow<CR>:split<CR>

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K


map <LEADER>l <C-w>h
map <LEADER>u <C-w>k
map <LEADER>r <C-w>l
map <LEADER>d <C-w>j

map tn :tabe<CR>
map tl :-tabnext<CR>
map tr :+tabnext<CR>

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize -5<CR>
map <right> :vertical resize +5<CR>

"利用vim plug来管理插件
call plug#begin('~/.vim/plugged')
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'iamcco/markdown-preview.nvim',{'do': { -> mkdp#util#install()}, 'for':['markdown','vim-plug']}
Plug 'scrooloose/nerdtree'
Plug 'lervag/vimtex'
Plug 'preservim/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'
Plug 'dhruvasagar/vim-table-mode'
"Plug 'connorholyday/vim-snazzy'
Plug 'w0rp/ale'
Plug 'mbbill/undotree'
Plug 'img-paste-devs/img-paste.vim'
call plug#end()

" 配置vim-markdown-toc
let g:vmt_cycle_list_item_markers = 1"
"::color snazzy
"let g:SnazzyTransparent = 1 "透明
"配置md_img_paste.vim
autocmd FileType markdown nnoremap <silent> <C-k> :call mdip#MarkdownClipboardImage()<CR>
let g:mdip_imgdir_absolute = '/Users/hui/Library/Mobile Documents/com~apple~CloudDocs/Downloads/Pandoc_MD2PPTX/hui/source/images/'
let g:mdip_imgdir_intext = '/images'
let g:mdip_imgdir = '/images'
let g:mdip_imgname = 'image'
"配置UltiSnip

let g:UltiSnipsExpandTrigger="<c-b>"         
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-g>"
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-Tab>'

let g:vim_markdown_math = 1

" 配置Latex编译器为xelatex
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_compiler_latexmk_engines = {'_':'-pdflatex'}
let g:vimtex_compiler_latexrun_engines ={'_':'pdflatex'}
"let g:vimtex_compiler_latexmk_engines = {'_':'-xelatex'}
"let g:vimtex_compiler_latexrun_engines ={'_':'xelatex'}
let g:vimtex_view_method = 'skim'
let g:vimtex_view_skim_sync = 1 
let g:vimtex_view_skim_activate = 1 

"Nerdtree
map tt :NERDTreeToggle<CR>
"let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"
let NERDTreeShowBookmarks = 1 "启动NERDTree时显示书签

au BufEnter *.md setlocal foldmethod=manual
"用r键来运行文件
map r :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!time python3 %"
  elseif &filetype == 'html'
   "exec "!firefox % &"
		exec "!open -a Safari %"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  endif
endfunc


