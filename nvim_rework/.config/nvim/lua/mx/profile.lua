PROFILE_LOAD = false

if PROFILE_LOAD then
  require("plenary.profile").start("/tmp/output_flame.log", { flame = true })
end

