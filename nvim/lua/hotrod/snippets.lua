local snippets = require "snippets"
local U = require "snippets.utils"

local function note_snippet(header)
  -- Put a dummy value for -1 and add a default later.
  local S = [[
${-1}:
 $0
   - ashkan, ${=os.date()}]]
  S = U.force_comment(S)
  S = U.match_indentation(S)
  return U.iterate_variables_by_id(
    S,
    -1,
    function(v)
      v.default = header
    end
  )
end

snippets.snippets = {
  _global = {
    todo = note_snippet "TODO",
    date = os.date("%a, %b %d, %Y")
  },
  lua = {
    req = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = require '$1']],
    func = [[function${1|vim.trim(S.v):gsub("^%S", " %0")}(${2|vim.trim(S.v)})$0 end]],
    ["local"] = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = ${1}]],
    -- Match the indentation of the current line for newlines
    ["for"] = U.match_indentation [[
for ${1:i}, ${2:v} in ipairs(${3:t}) do
  $0
end]]
  },
  javascript = {
    cl = [[console.log($0)]],
    user_input = [[hey? ${-1=vim.fn.input("what's up? ")} = ${-1}]],
    imp = [[import ${2} from '${1}'$0]],
    useEffect = [[
useEffect(() => {
  $0
}${1:, [}${=string.len(S[1])>0 and ']'})
]],
    useState = [[
const [${1}, set${-1|S[1]:sub(1,1):upper()}${-1|S[1]:sub(2,-1)}] = useState(${0})
]]
  }
}
