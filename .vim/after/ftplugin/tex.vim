" .tex specific settings
setlocal spell spelllang=en_us
let g:Tex_AdvancedMath = 1

"Vim-Latex Suite Settings
let g:Tex_DefaultTargetFormat= 'pdf'

"let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'
"let g:Tex_CompileRule_ps = 'dvips -Pwww -o $*.ps $*.dvi'
"let g:Tex_CompileRule_pspdf = 'ps2pdf $*.ps'
"let g:Tex_CompileRule_dvipdf = 'dvipdfm $*.dvi'
"let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 --interaction=nonstopmode $*'

let g:Tex_ViewRule_dvi = 'Skim'
let g:Tex_ViewRule_ps = 'Skim'
let g:Tex_ViewRule_pdf = 'Skim'
let g:Tex_IgnoreLevel = 7
let g:Tex_FormatDependency_ps  = 'dvi,ps'
let g:Tex_FormatDependency_pspdf = 'dvi,ps,pspdf'
let g:Tex_FormatDependency_dvipdf = 'dvi,dvipdf'

let g:Tex_PromptedEnvironments='equation,equation*,align,align*,enumerate,itemize,figure,table,theorem,lemma,tikzpicture'

" Custom mappings
call IMAP('EDG', "      edge[<+options+>] node {<+path-label+>} (<+end-node+>)", 'tex')
call IMAP('TIKZ', "\\begin{tikzpicture}[shorten >=1pt,node distance=3cm,on grid,auto]", 'tex')
call IMAP('NODES', "\<C-r>=Nodes()\<CR>", 'tex')
call IMAP('INV', "^{-1}", 'tex')
call IMAP('SEQ', "\\{<++>\\}_{n=1}^\\infty<++>", 'tex')
map :w :w<cr><leader>ll

function! Nodes()
    let numn = input("Enter number of nodes: ") 
python3 << endpython
import vim
num = int(vim.eval('numn'))
end = [] #array of strings, 1 per line
for i in range(0, num):
  qi = "q_{}".format(i)
  end.append("\node[state, <+options+>] ({}) {{${}$}};".format(qi, qi))

end.append("path[->]")  

for i in range(0, num):
  end.append("({}) edge[<+options+>] node {{<+path-label+>}} (<+end-node+>)".format("q_{}".format(i)))

 
vim.eval("append('.',{})".format(end))  
endpython
endfunction
