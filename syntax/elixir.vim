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

syn match elixirTuple                        /{\|}/
syn match elixirList                         /\[\|\]/

" Used in binaries
syn keyword elixirType               float

syn match Comment                    "#.*" contains=@Spell,erlangTodo
syn keyword elixirKeyword            def defp defmacro end defmodule use defrecord nextgroup=elixirFunction skipwhite

syn match elixirFunction "\%(\%(def\s\|defp\s\)\s*\)\@<=\h\%(\w\|\.\)*" contained

syn match elixirChar                 /?\\\?./

syn keyword elixirGuard is_atom is_binary is_bitstring is_boolean is_float is_function
syn keyword elixirGuard is_function is_integer is_list is_number is_pid is_port is_record
syn keyword elixirGuard is_record is_reference is_tuple is_exception

syn keyword elixirBuiltIn abs bit_size byte_size elem float hd length 
syn keyword elixirBuiltIn node node round self size tl trunc tuple_size

"syn keyword elixirConditional        case match else if elsif end
"syn keyword elixirConditional        not and or andalso orelse
"syn keyword elixirConditional        when

syn keyword elixirBound              __bound__

syn keyword elixirPseudoVariable     nil

syn keyword elixirComparator         = := == > < >= <= + - * /

syn match elixirErlang               /\<Erlang\>/

syn match elixirInstanceVariable     /@\h\w*/

syn keyword elixirBoolean            true false :true :false

syn match  elixirMethodDeclaration   "[^[:space:];#(]\+"	 contained contains=elixirBoolean,elixirPseudoVariable,elixirInstanceVariable
syn match  elixirModuleDeclaration   "[^[:space:];#<]\+"	 contained contains=elixirOperator

syn match elixirControl "\<def\>[?!]\@!"    nextgroup=elixirMethodDeclaration skipwhite skipnl
syn match elixirControl "\<module\>[?!]\@!" nextgroup=elixirModuleDeclaration skipwhite skipnl
syn match elixirControl "\<\%(case\|match\|begin\|do\|for\|if\|unless\|while\|until\|else\|elsif\|ensure\|then\|when\|end\)\>[?!]\@!"

syn match elixirAttribute /^\s*@\%(vsn\|behaviour\|behavior\|compile\|overrideable\|spec\|callback\|type\|moduledoc\|doc\|on_load\)\s\+/

syn match elixirMacro /__\%(OP\|BLOCK\|KVBLOCK\|MODULE\|FILE\|LINE\|FUNCTION\|REF\)__/

syn region elixirInterpolation          matchgroup=elixirInterpolationDelimiter start="#{" end="}" contained
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

syn region elixirHeredoc             start=/"""/ end=/^\s*"""/ skip=/\\/ contains=@Spell,elixirStringModifier,elixirInterpolation
syn region elixirHeredoc             start=/'''/ end=/^\s*'''/ skip=/\\/ contains=@Spell,elixirStringModifier,elixirInterpolation

syn match elixirModule  /\(::\)\?[A-Z][A-Za-z]*/

syn match elixirAtom                 /:\h[A-Za-z0-9?!_]*/

hi link elixirHeredoc        String
hi link elixirString         String
hi link elixirStringModifier SpecialChar
hi link elixirInteger        Number
hi link elixirFloat          Float
hi link elixirBoolean        Boolean
hi link elixirAtom           Constant
hi link elixirChar           Character

hi link elixirMacro          Macro

hi link elixirGuard          Conditional
hi link elixirBuiltIn        Function

hi link elixirFunction       Function

hi link elixirConditional    Conditional
hi link elixirMemberVariable Special
hi link elixirPseudoVariable Constant

hi link elixirAttribute      Keyword

hi link elixirErlang         Function
hi link elixirKeyword        Keyword
hi link elixirBlankSlate     Structure

hi link elixirComparator     Operator
hi link elixirBound          Special

hi link elixirType           Type
hi link elixirControl        Statement
hi link elixirModule         Structure

hi link elixirTuple          Delimiter  
hi link elixirList           Delimiter  
