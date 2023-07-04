local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

ls.add_snippets(nil, {
	all = {
		s("ternary", {
			i(1, "cond"),
			t(" ? "),
			i(2, "then"),
			t(" : "),
			i(3, "else"),
		}),
	},
	cpp = {
		s(
			"cp",
			fmt(
				[[
        #include <bits/stdc++.h>

        using namespace std;

        #define ll long long

        int main() {{
            ios_base::sync_with_stdio(false);
            cin.tie(nullptr);
            int testcase;
            cin >> testcase;
            while(testcase--){{
                {}
            }}
            return 0;
        }}
        ]],
				{ i(0) }
			)
		),
		s(
			"bp",
			fmt(
				[[
        #include <bits/stdc++.h>

        using namespace std;

        int main() {{
            {}
            return 0;
        }}
        ]],
				{ i(0) }
			)
		),
	},
	lua = {
		s("req", fmt([[local {} = require("{}")]], { rep(1), i(1) })),
	},
	norg = {
		s(
			"journal",
			fmt(
				[[
        * Time Line
          - (-) 06:30..07:00 -> Morning routine with a little game
          - (-) 07:00..08:00 -> Make plans for the day and touch up on some tech news 
          - 08:00..09:00 -> 
          - 09:00..10:00 -> 
          - 10:00..11:00 -> 
          - 11:00..12:00 -> 
          - 12:00..13:00 -> 
          - 13:00..14:00 -> 
          - 14:00..15:00 -> 
          - 15:00..16:00 -> 
          - 16:00..17:00 -> 
          - 17:00..18:00 -> 
          - 18:00..19:00 -> 
          - 19:00..20:00 -> 
          - 20:00..21:00 -> 
          - 21:00..22:00 -> 
          - 22:00..23:00 -> 
          - 23:00..06:30 -> Sleep till 6:30

        * Todo List
          - Read (atmost) 30 chapters of manga
          - 
        ]],
				{}
			)
		),
	},
	yaml = {
		s(
			"dp",
			fmt(
				[[
        apiVersion: apps/v1
        kind: Deployment
        metadata:
          name: {}-deployment
          labels:
            app: {} 
        spec:
          selector:
            matchLabels:
              app: {} 
          template:
            metadata:
              labels:
                app: {} 
            spec:
              containers:
              - name: {}
                image: {}:latest
                ports:
                - containerPort: {}
        ]],
				{ i(1), rep(1), rep(1), rep(1), rep(1), i(2), i(3, "80") }
			)
		),
		s(
			"se",
			fmt(
				[[
        apiVersion: v1
        kind: Service
        metadata:
          name: {}-service
        spec:
          type: NodePort
          selector:
            app: {} 
          ports:
          - protocol: TCP
            port: {} 
            targetPort: {} 
        ]],
				{ i(1), rep(1), i(2, "8000"), i(3, "80") }
			)
		),
	},
	rust = {

		s("derivedebug", t("#[derive(Debug)]")),
		s("deadcode", t("#[allow(dead_code)]")),
		s("allowfreedom", t("#![allow(clippy::disallowed_names, unused_variables, dead_code)]")),

		s("clippypedantic", t("#![warn(clippy::all, clippy::pedantic)]")),

		s(":turbofish", { t({ "::<" }), i(0), t({ ">" }) }),

		s("print", {
			-- t {'println!("'}, i(1), t {' {:?}", '}, i(0), t {');'}}),
			t({ 'println!("' }),
			i(1),
			t({ " {" }),
			i(0),
			t({ ':?}");' }),
		}),

		s("for", {
			t({ "for " }),
			i(1),
			t({ " in " }),
			i(2),
			t({ " {", "" }),
			i(0),
			t({ "}", "" }),
		}),

		s("struct", {
			t({ "#[derive(Debug)]", "" }),
			t({ "struct " }),
			i(1),
			t({ " {", "" }),
			i(0),
			t({ "}", "" }),
		}),

		s("test", {
			t({ "#[test]", "" }),
			t({ "fn " }),
			i(1),
			t({ "() {", "" }),
			t({ "	assert" }),
			i(0),
			t({ "", "" }),
			t({ "}" }),
		}),

		s("testcfg", {
			t({ "#[cfg(test)]", "" }),
			t({ "mod " }),
			i(1),
			t({ " {", "" }),
			t({ "	#[test]", "" }),
			t({ "	fn " }),
			i(2),
			t({ "() {", "" }),
			t({ "		assert" }),
			i(0),
			t({ "", "" }),
			t({ "	}", "" }),
			t({ "}" }),
		}),

		s("if", {
			t({ "if " }),
			i(1),
			t({ " {", "" }),
			i(0),
			t({ "}" }),
		}),
	},
})
