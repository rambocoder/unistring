#unistring
=========

##Why
Starting with Erlang **R16B**, [string module](http://www.erlang.org/doc/man/string.html) in standard library handles Unicode utf-8 strings very well, except that ```string:to_upper/1``` and ```string:to_lower/1``` ignore unicode code points > 255. 

Unistring library uses Lowercase Mapping, Uppercase Mapping and Titlecase Mapping columns hexadecimal values from [UnicodeData.txt](ftp://ftp.unicode.org/Public/UNIDATA/UnicodeData.txt).

##License
Public Domain

##API
Unicode utf-8 functions for Erlang:

```erlang
unistring:to_lower/1
unistring:to_upper/1
unistring:to_title/1
```

Input to functions can be in ```charlist()``` or ```unicode_binary()``` format.

charlist() is a list of unicode code points, such as: ```[50504,45397,54616,49464,50836]``` means ```"안녕하세요"```.
unicode_binary() is a binary string with utf8 encoding, such as: ```<<236,149,136,235,133,149,237,149,152,236,132,184,236,154,148>>``` means ```"안녕하세요"```.

charlist() and unicode_binary() can be converted from one to another using the [unicode module](http://www.erlang.org/doc/man/unicode.html) in Erlang **R16B** or later.

##Examples
Make sure to start your erl shell with ```erl +pc unicode```
Make sure to add ```%% -*- coding: utf-8 -*-``` to the beginning of your ```*.erl``` source code files if you will be using unicode characters inside of quotes.
If you are creating unicode binary strings, make sure to append **/utf8** after the string's end quote mark inside of <<>> such as: ```<<"안녕하세요"/utf8>>.

```erlang
%% unistring:to_lower/1

"test" = unistring:to_lower("TEST").
<<"test">> = unistring:to_lower(<<"TEST">>).
"привет" = unistring:to_lower("ПРИВЕТ").
<<"привет"/utf8>> = unistring:to_lower(<<"ПРИВЕТ"/utf8>>).

%% unistring:to_upper/1
"TEST" = unistring:to_upper("test").
<<"TEST">> = unistring:to_upper(<<"test">>).
"ПРИВЕТ" = unistring:to_upper("привет").
<<"ПРИВЕТ"/utf8>> = unistring:to_upper(<<"привет"/utf8>>).
```

##Note
I don't really see the point of ```unistring:to_title/1``` but it is included in this library for completeness.