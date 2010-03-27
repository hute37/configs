# vim: filetype=config:
local curdir="%d"
local hostname="%M"
local username="%n"
local bold="%B"
local unbold="%b"
local standout="%S"
local unstandout="%s"
local colorfg="%F"
local uncolorfg="%f"
local colorbg="%K"
local uncolorbg="%k"
local mytime="%*"
local mydate="%D"
local line_tty="%y"
local rootorwhat="%#"
local return_status="%?"

PROMPT="$bold$username$unbold$uncolorfg$bold$colorfg{red}@$unbold$uncolorfg$hostname | $colorfg{blue}$bold$curdir$unbold$uncolorfg
$colorfg{red}$bold»$unbold$uncolorfg "
