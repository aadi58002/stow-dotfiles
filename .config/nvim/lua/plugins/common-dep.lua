local add = MiniDeps.add

local deps = {
}

for _,dep in ipairs(deps) do
  add({source = dep.source, name = dep.name })
end
