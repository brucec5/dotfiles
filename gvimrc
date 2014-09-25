let s:uname = system("echo -n \"$(uname)\"")
if s:uname == "Linux"
  set guifont=Fixed\ Medium\ Semi-Condensed\ 10
else
  set guifont=Source\ Code\ Pro:h12
endif
set guioptions-=T
set guioptions-=r
set guioptions-=m
set guioptions-=L
