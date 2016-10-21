# Vim Cheatsheet

## Motions and Moving

### Moving within a line

|Mapping|Summary|
|---|---|
|h, l|move left/right by character|
|w|move forward one (w)ord|
|b|move (b)ackward one word|
|e|move forward to the (e)nd a word|

### Jumping within a line

|Mapping|Summary|
|---|---|
|f<char>|(f)ind a character forward in a line and move to it|
|t<char>|find a character forward in a line and move un(t)il it (one character before)|
|F<char>|(f)ind a character backward in a line and move to it|
|T<char>|find a character backward in a line and move un(t)il it|
|;|repeat last f, t, F, or T command|
|,|repeat last f, t, F, or T command, but in opposite direction|

### Moving between lines

|Mapping|Summary|
|---|---|
|j, k|move up/down one line|
|H, M, L|move (H)igh, (M)iddle, or (L)ow within the viewport|
|/|search|
|n|repeat last search|
|N|repeat last search in opposite direction|
|C-u, C-d|move (u)p or (d)own|
|<NN>G|(G)o to line number NN (useful if you have a failing test on a given line)|

### Commands

|Mapping|Summary|
|---|---|
|d|Delete|
|c|Change|
|y|Yank (copy)|
|v|Visually select|
|>, <|indent, dedent|
|=|reformat (reindent, break long lines, etc)|

### Motions

|Mapping|Summary|
|---|---|
|de|Delete to the end of the current word|
|d2e|Delete to the end of next word|
|dj|Delete down a line (current and one below)|
|dt)|Delete up until next closing parenthesis|
|d/world|Delete up until the first search match for "world"|

### Text Objects

|Mapping|Summary|
|---|---|
|iw, aw|"inner word", "a word" (a word includes the space)|
|ip, ap|"inner paragraph", "a paragraph" ("a" includes the newline)|
|i), a)|"theinner parenthesis", "a parenthesis" (includes the parens)|
|i', a'|"inner single quote", "a single quote" (includes the quotes)|
|i", a"|"inner downuble quote", "a double quote" (includes the quotes)|
|it, at|"inner tag",tag "a tag" (includes the open and closing tag)|

## Windows & Tabs

### Windows

#### Opening Windows

|Command|Operation|
|---|---|
|:new [filename]|Open a new window above the current window|
|:vnew [filename]|Open a new window beside the current window|
|:split <filename>|Edit the specified file in new window above the current window|
|:vsplit <filename>|Edit the specified file in new window beside the current window|

#### Moving Between Windows

|Mapping|Operation|
|---|---|
|<C-w>h,j,k,l|Navigate to the window in the given direction (<C-w>j navigates down)|
|<C-w>H,J,K,L|Move the current window in the given direction (<C-w>J moves it down)|
|[count]<C-w>-|Decrease the height of the current window by count|
|[count]<C-w>+|Increase the height of the current window by count|
|[count]<C-w><|Decrease the width of the current window by count|
|[count]<C-w>>|Increase the width of the current window by count|
|<C-w>=|Equalize the width and height of all windows|

#### Positioning the Buffer In the Window

|Mapping|Operation|
|---|---|
|zz|Center the current line within the window|
|zt|Bring the current line to the top of the window|
|zb|Bring the current line to the bottom of the window|

#### Cut & Copy & Paste

|Command|Operation|
|---|---|
|d|delte, Cut|
|y|yank, Copy|
|P|To paste before the cursor|
|p|To paste after the cursor|

