let s:uname = system("echo -n \"$(uname)\"")
if s:uname == "Linux"
  set guifont=Fixed\ Medium\ Semi-Condensed\ 10
else
  set guifont=Osaka-Mono:h12
endif
set guioptions-=T
set guioptions-=r
set guioptions-=m
set guioptions-=L
