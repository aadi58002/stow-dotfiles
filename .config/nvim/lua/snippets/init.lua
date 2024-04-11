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
            fmt([[
                #include <bits/stdc++.h>

                using namespace std;

                // clang-format off
                #define clz __builtin_clz
                #define ctz __builtin_ctz
                #define cnz __builtin_popcount
                #define clmsb __builtin_clrsb
                #define bitswap __builtin_bswap32

                #define clzl __builtin_clzl
                #define ctzl __builtin_ctzl
                #define cnzl __builtin_popcountl
                #define clmsbl __builtin_clrsb
                #define bitswapl __builtin_bswap64

                #define mod       1000000007
                #define mods      998244353
                #define all(x)    (x).begin(), (x).end()
                #define pwp(x,y)  fixed<<setprecision(y)<<x
                #define FIO()     ios_base::sync_with_stdio(0); cin.tie(0); cout.tie(0)
                #define repeat    int t;cin>>t;while(t--)

                vector<long long>sieve(long long n){{long long*arr=new long long[n+1];vector<long long>vect;for(long long i=2;i<=n;i++)if(arr[i]==0){{vect.push_back(i);for(long long j=2*i;j<=n;j+=i)arr[j]=1;}}free(arr);return vect;}}
                long long power(long long x,unsigned long long y,long long m){{long long res=1;x=x%m;if(x==0)return 0;while(y>0){{if(y&1)res=(res*x)%m;y=y>>1;x=(x*x)%m;}}return res;}}
                long long mod_inverse(long long a,long long p){{return power(a,p-2,p);}}
                long long mod_add(long long a,long long b,long long m){{a=a%m;b=b%m;return(((a+b)%m)+m)%m;}}
                long long mod_mul(long long a,long long b,long long m){{a=a%m;b=b%m;return(((a*b)%m)+m)%m;}}
                long long mod_sub(long long a,long long b,long long m){{a=a%m;b=b%m;return(((a-b)%m)+m)%m;}}
                long long mod_div(long long a,long long b,long long m){{a=a%m;b=b%m;return(mod_mul(a,mod_inverse(b,m),m)+m)%m;}}
                void y_or_n(bool val){{if(val) cout << "YES" << endl; else cout << "NO" << endl;}}

                string binary(long long n) {{string s;while (n) {{s.push_back(n % 2 + '0');n /= 2;}}reverse(s.begin(), s.end());return s;}}

                #if !defined(ONLINE_JUDGE) && 1
                #define dbg(x) cerr << #x <<" "; _print(x); cerr << endl;
                #else
                #define dbg(x)
                #endif

                template <class T> void _print(T t) {{cerr << t;}}
                void _print(string t) {{cerr << '"' << t << '"';}}
                template <class T> void _print(vector <T> v) {{cerr << "[ "; for (T i : v) {{_print(i); cerr << " ";}} cerr << "]"<<endl;}}
                template <class T> void _print(set <T> v) {{cerr << "[ "; for (T i : v) {{_print(i); cerr << " ";}} cerr << "]";}}
                template <class T> void _print(multiset <T> v) {{cerr << "[ "; for (T i : v) {{_print(i); cerr << " ";}} cerr << "]";}}
                template <class T, class V> void _print(pair <T, V> p) {{cerr << "{{"; _print(p.first); cerr << ","; _print(p.second); cerr << "}}";}}
                template <class T, class V> void _print(map <T, V> v) {{cerr << "[ "; for (auto i : v) {{_print(i); cerr << " ";}} cerr << "]";}}

                #define ll long long
                // clang-format on

                int main() {{
                    FIO();
                    repeat {{
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
