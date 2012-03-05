" Vim syntax file
" Language:         Elixir
" Maintainer:       Ryan Huffman <ryanhuffman@gmail.com>
" URL:              https://github.com/huffman/vim-elixir
" Last Change:      2011 Aug 15

" Both the ruby vim syntax file maintained by Doug Kearns and the
" erlang vim syntax file from the vimerl project were used as a reference
" and as a sometimes as a base when creating this file.

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

" From ruby.vim
syn match elixirInteger "\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<0[xX]\x\+\%(_\x\+\)*\>"								display
syn match elixirInteger "\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<\%(0[dD]\)\=\%(0\|[1-9]\d*\%(_\d\+\)*\)\>"						display
syn match elixirInteger "\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<0[oO]\=\o\+\%(_\o\+\)*\>"								display
syn match elixirInteger "\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<0[bB][01]\+\%(_[01]\+\)*\>"								display
syn match elixirFloat   "\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<\%(0\|[1-9]\d*\%(_\d\+\)*\)\.\d\+\%(_\d\+\)*\>"					display
syn match elixirFloat   "\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<\%(0\|[1-9]\d*\%(_\d\+\)*\)\%(\.\d\+\%(_\d\+\)*\)\=\%([eE][-+]\=\d\+\%(_\d\+\)*\)\>"	display

syn match elixirModule  /[A-Z][A-Za-z]*/

syn match elixirTuple                        /{\|}/
syn match elixirList                         /\[\|\]/

" Used in binaries
syn keyword elixirType               float

syn match Comment                    "#.*" contains=@Spell,erlangTodo
syn keyword elixirKeyword            def defp defmacro end defmodule use
"syn match Keyword                    /module .*$/
"
syn match elixirChar                 /?\\\?./

"syn keyword elixirConditional        case match else if elsif end
"syn keyword elixirConditional        not and or andalso orelse
"syn keyword elixirConditional        when

syn keyword elixirBound              __bound__

syn keyword elixirPseudoVariable     nil

syn keyword elixirComparator         = := == > < >= <= + - * /

syn match elixirFunction             /def \h\w*/

syn match elixirErlang               /\<Erlang\>/

syn match elixirInstanceVariable     /@\h\w*/

syn keyword elixirBoolean            true false 'true 'false

syn match  elixirMethodDeclaration   "[^[:space:];#(]\+"	 contained contains=elixirBoolean,elixirPseudoVariable,elixirInstanceVariable
syn match  elixirModuleDeclaration   "[^[:space:];#<]\+"	 contained contains=elixirOperator

syn match elixirControl "\<def\>[?!]\@!"    nextgroup=elixirMethodDeclaration skipwhite skipnl
syn match elixirControl "\<module\>[?!]\@!" nextgroup=elixirModuleDeclaration skipwhite skipnl
syn match elixirControl "\<\%(case\|begin\|do\|for\|if\|unless\|while\|until\|else\|elsif\|ensure\|then\|when\|end\)\>[?!]\@!"

" From ruby.vim
syn region elixirInterpolation          matchgroup=elixirInterpolationDelimiter start="#{" end="}" contained contains=ALLBUT,@elixirNotTop
syn match  elixirInterpolation          "#\%(\$\|@@\=\)\w\+"    display contained contains=elixirInterpolationDelimiter,elixirInstanceVariable,elixirGlobalVariable,elixirPredefinedVariable
syn match  elixirInterpolationDelimiter "#\ze\%(\$\|@@\=\)\w\+" display contained
syn match  elixirInterpolation          "#\$\%(-\w\|\W\)"       display contained contains=elixirInterpolationDelimiter,elixirPredefinedVariable,elixirInvalidVariable
syn match  elixirInterpolationDelimiter "#\ze\$\%(-\w\|\W\)"    display contained
syn region elixirNoInterpolation        start="\\#{" end="}"            contained
syn match  elixirNoInterpolation        "\\#{"                  display contained
syn match  elixirNoInterpolation        "\\#\%(\$\|@@\=\)\w\+"  display contained
syn match  elixirNoInterpolation        "\\#\$\W"               display contained

syn match elixirStringModifier       /\\./ contained
syn match elixirStringModifier       /\~\%(-\?[0-9*]\+\)\?\%(\.[0-9*]\+\..\?\)\?\%(c\|f\|e\|g\|s\|w\|p\|W\|P\|B\|X\|#\|b\|+\|n\|i\)/ contained
syn region elixirString              start=/"/ end=/"/ skip=/\\/ contains=@Spell,elixirStringModifier,elixirInterpolation

syn match elixirAtom                 /'\h[A-Za-z0-9?!_]*/
syn match elixirAtom                 /'".*"/

hi link elixirString         String
hi link elixirInteger        Number
hi link elixirFloat          Float
hi link elixirBoolean        Boolean
hi link elixirAtom           Constant
hi link elixirChar           Character

hi link elixirConditional    Conditional
hi link elixirMemberVariable Special
hi link elixirPseudoVariable Constant

hi link elixirErlang         Function
hi link elixirKeyword        Define
hi link elixirBlankSlate     Structure

hi link elixirComparator     Operator
hi link elixirBound          Special

hi link elixirType           Type
hi link elixirControl        Statement
hi link elixirModule         Structure

hi link elixirTuple          Delimiter  
hi link elixirList           Delimiter  
