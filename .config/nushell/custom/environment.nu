bash -c $"source ($env.HOME)/.profile && env"
    | lines
    | parse "{n}={v}"
    | where { |x| ($x.n not-in $env) or $x.v != ($env | get $x.n) }
    | where n not-in ["_", "LAST_EXIT_CODE", "DIRS_POSITION"]
    | transpose --header-row
    | into record
    | load-env