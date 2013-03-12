%% -*- coding: utf-8 -*-
-module(unistring_tests).
-include_lib("eunit/include/eunit.hrl").

to_lower_test() ->
	?assertEqual("test", unistring:to_lower("TEST")),
	?assertEqual(<<"test">>, unistring:to_lower(<<"TEST">>)),
	?assertEqual("привет", unistring:to_lower("ПРИВЕТ")),
	?assertEqual(<<"привет"/utf8>>, unistring:to_lower(<<"ПРИВЕТ"/utf8>>)).

to_upper_test() ->
	?assertEqual("TEST", unistring:to_upper("test")),
	?assertEqual(<<"TEST">>, unistring:to_upper(<<"test">>)),
	?assertEqual("ПРИВЕТ", unistring:to_upper("привет")),
	?assertEqual(<<"ПРИВЕТ"/utf8>>, unistring:to_upper(<<"привет"/utf8>>)).