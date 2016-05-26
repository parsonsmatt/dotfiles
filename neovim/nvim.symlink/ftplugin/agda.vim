imap <buffer> \forall ∀ 
imap <buffer> \to → 
imap <buffer> \lambda λ 
imap <buffer> \Sigma Σ 
imap <buffer> \exists ∃ 
imap <buffer> \equiv ≡



command! -nargs=0 Load call Load(0)
command! -nargs=0 AgdaVersion call AgdaVersion(0)
command! -nargs=0 Reload silent! make!|redraw!
command! -nargs=0 RestartAgda exec 'python ' 'RestartAgda()'
command! -nargs=0 ShowImplicitArguments exec 'python ' "sendCommand('ShowImplicitArgs True')"
command! -nargs=0 HideImplicitArguments exec 'python ' "sendCommand('ShowImplicitArgs False')"
command! -nargs=0 ToggleImplicitArguments exec 'python ' "sendCommand('ToggleImplicitArgs')"
command! -nargs=0 Constraints exec 'python ' "sendCommand('Cmd_constraints')"
command! -nargs=0 Metas 'python ' "sendCommand('Cmd_metas')"
command! -nargs=0 SolveAll exec 'python ' "sendCommand('Cmd_solveAll')"
command! -nargs=1 ShowModule call ShowModule(<args>)
command! -nargs=1 WhyInScope call WhyInScope(<args>)
command! -nargs=1 SetRewriteMode exec 'python ' "setRewriteMode('<args>')"

nnoremap <buffer> <LocalLeader>l :Reload<CR>
nnoremap <buffer> <LocalLeader>t :call Infer()<CR>
nnoremap <buffer> <LocalLeader>r :call Refine("False")<CR>
nnoremap <buffer> <LocalLeader>R :call Refine("True")<CR>
nnoremap <buffer> <LocalLeader>g :call Give()<CR>
nnoremap <buffer> <LocalLeader>c :call MakeCase()<CR>
nnoremap <buffer> <LocalLeader>a :call Auto()<CR>
nnoremap <buffer> <LocalLeader>e :call Context()<CR>
nnoremap <buffer> <LocalLeader>n :call Normalize("False")<CR>
nnoremap <buffer> <LocalLeader>N :call Normalize("True")<CR>
nnoremap <buffer> <LocalLeader>M :call ShowModule('')<CR>
nnoremap <buffer> <LocalLeader>y :call WhyInScope('')<CR>
nnoremap <buffer> <LocalLeader>m :Metas<CR>

" Show/reload metas
nnoremap <buffer> <C-e> :Metas<CR>
imap <buffer> <C-e> <C-o>:Metas<CR>

" Go to next/previous meta
nnoremap <buffer> <silent> <C-g>  :let _s=@/<CR>/ {!\\| ?<CR>:let @/=_s<CR>2l
imap <buffer> <silent> <C-g>  <C-o>:let _s=@/<CR><C-o>/ {!\\| ?<CR><C-o>:let @/=_s<CR><C-o>2l

nnoremap <buffer> <silent> <C-y>  2h:let _s=@/<CR>? {!\\| \?<CR>:let @/=_s<CR>2l
imap <buffer> <silent> <C-y>  <C-o>2h<C-o>:let _s=@/<CR><C-o>? {!\\| \?<CR><C-o>:let @/=_s<CR><C-o>2l
