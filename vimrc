filetype plugin indent off

"--------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	call neobundle#begin(expand('~/.vim/bundle/'))
endif

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'drillbits/nyan-modoki.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'Align'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}

" ステータスラインをリッチにする
NeoBundle 'Lokaltog/vim-powerline'

NeoBundle 'tpope/vim-repeat'

" カラースキーム一覧表示に Unite.vim を使う
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'

" molokai カラースキーム
NeoBundle 'tomasr/molokai'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

" NeoBundle 'drillbits/nyan-modoki.vim'の設定
set laststatus=2
set statusline=%F%m%r%h%w[%{&ff}]%=%{g:NyanModoki()}(%l,%c)[%P]
let g:nyan_modoki_select_cat_face_number = 2
let g:nayn_modoki_animation_enabled= 1

"------------------------------------
" ColorScheme
"------------------------------------
colorscheme molokai

"------------------------------------
" neocomplcache（自動補完）を有効化
"------------------------------------
let g:neocomplcache_enable_at_startup = 1

"------------------------------------
" Align
"------------------------------------
" Alignを日本語環境で使用するための設定
let g:Align_xstrlen = 3

"------------------------------------
" javascript syntax
"------------------------------------
au FileType javascript call JavaScriptFold()

"------------------------------------
" emmet
"------------------------------------
filetype plugin indent on

let g:user_emmet_settings = {
			\  'lang' : 'ja',
			\  'html' : {
			\    'filters' : 'html',
			\    'indentation' : ''
			\  },
			\  'php' : {
			\    'extends' : 'html',
			\    'filters' : 'html,c',
			\  },
			\  'css' : {
			\    'filters' : 'fc',
			\  },
			\  'javascript' : {
			\    'snippets' : {
			\      'jq' : "$(function() {\n\t${cursor}${child}\n});",
			\      'jq:each' : "$.each(arr, function(index, item)\n\t${child}\n});",
			\      'fn' : "(function() {\n\t${cursor}\n})();",
			\      'tm' : "setTimeout(function() {\n\t${cursor}\n}, 100);",
			\      'jqcdn' : "<script src='https://code.jquery.com/jquery-2.1.1.min.js'></script>",
			\      'bootstrap' : "<script src ='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js'></script>",
			\    },
			\  },
			\ 'java' : {
			\  'indentation' : '  ',
			\  'snippets' : {
			\   'main': "public static void main(String[] args) {\n\t|\n}",
			\   'println': "System.out.println(\"|\");",
			\   'class': "public class | {\n}\n",
			\   'jqcdn': "<script src='https://code.jquery.com/jquery-2.1.1.min.js'></script>",
			\  },
			\ },
			\}

"-------------------------
" End Neobundle Settings.
"-------------------------

"------------------------------------
" Backup
"------------------------------------
set nobackup " バックアップなし
set noswapfile " スワップファイルを作らない
set noundofile " un~ファイルを作らない

"------------------------------------
" Encode
"------------------------------------
set fileformats=unix,dos,mac " 改行コード
set encoding=utf-8 " デフォルトエンコーディング
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc " ワイルドカードで表示するときに優先度を低くする拡張子

"------------------------------------
" Basic
"------------------------------------
set scrolloff=5 " スクロール時の余白確保
set textwidth=0 " 自動で折り返しをしない
set autoread " 自動読み直し
set hidden " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start "バックスペースキーで削除できるものを指定
set vb t_vb= " ビープ音を鳴らさない
set browsedir=buffer " Exploreの初期ディレクトリ
set showcmd " コマンドをステータス行に表示
set showmode " 現在のモードを表示
set modelines=0 " モードラインは無効

"------------------------------------
" Indentation
"------------------------------------
set autoindent " 自動でインデント
set smartindent " 新しい行のインデントを現在行と同じ数に
set tabstop=2 "画面上でタブ文字が占める幅
set shiftwidth=2 "自動インデントでずれる幅

"------------------------------------
" Show
"------------------------------------
set number " 行番号表示
set list " 不可視文字表示
set listchars=tab:>\ ,extends:<
set showmatch " 対応する括弧をハイライト
set title " タイトルを表示する
set ruler " ルーラーを表示
set laststatus=2 " 常にステータラスラインを表示
" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=red guibg=darkgray
match ZenkakuSpace /　/
set cursorline " カーソル行をハイライト
set ttyfast " 高速ターミナル接続を行う
" コマンドラインの高さ(GUI使用時)
set cmdheight=1
let s:ext = fnamemodify(bufname(""), ":e")
"補完ウィンドウの色
highlight Pmenu guibg=#666666
highlight PmenuSel guibg=#AA0000 guifg=#FFFFFF

"------------------------------------
" Other
"------------------------------------
" インサートモードでもhjklで移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" インサートモードのyyでEsc
inoremap <silent> yy <ESC>
"inoremap <silent> <C-j> <esc>

"括弧の補完
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

"検索ハイライトの色
highlight IncSearch guifg=white guibg=black
highlight Search guifg=white guibg=blue

"カーソルの色
highlight Cursor guibg=white guifg=black

" 0, -で行頭、行末へ
nmap 0 ^
nmap - $

" ビジュアルモード時vで行末まで選択
vnoremap v $h

" buftabs（常にバッファ番号を表示）の設定
let buftabs_only_basename = 1
let buftabs_in_statusline = 1

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge

