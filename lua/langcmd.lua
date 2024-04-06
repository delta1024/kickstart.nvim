local create_cmd = vim.api.nvim_create_user_command
create_cmd("Go", function (opts)
  local fmt = "go "
  for _, cmd in ipairs(opts.fargs) do
    fmt = fmt .. cmd .. " "
  end

  vim.cmd("!"..fmt)
end, {nargs = '+',
  complete = function (ArgLead, CmdLine, CursorPos)
      local choices = {
        ["b"] = {"bug", "build"},
        ["bu"] = {"bug", "build"},
        ["bui"] = {"build"},
        ["buil"] = {"build"},

        ["c"] = {"clean"},
        ["cl"] = {"clean"},
        ["cle"] = {"clean"},
        ["clea"] = {"clean"},

        ["d"] = {"doc"},
        ["do"] = {"doc"},

        ["e"] = {"env"},
        ["en"] = {"env"},

        ["f"] = {"fix", "fmt"},
        ["fi"] = {"fix"},
        ["fm"] = {"fmt"},

        ["g"] = {"get", "generate"},
        ["ge"] = {"get", "generate"},
        ["gen"] = {"generate"},
        ["gene"] = {"generate"},
        ["gener"] = {"generate"},
        ["genera"] = {"generate"},
        ["generat"] = {"generate"},

        ["h"] = {"help"},
        ["he"] = {"help"},
        ["hel"] = {"help"},

        ["i"] = {"install"},
        ["in"] = {"install"},
        ["ins"] = {"install"},
        ["inst"] = {"install"},
        ["insta"] = {"install"},
        ["instal"] = {"install"},

        ["l"] = {"list"},
        ["li"] = {"list"},
        ["lis"] = {"list"},

        ["m"] = {"mod"},
        ["mo"] = {"mod"},

        ["w"] = {"work"},
        ["wo"] = {"work"},
        ["wor"] = {"work"},

        ["r"] = {"run"},
        ["ru"] = {"run"},
        ["run"] = {"run ."},

        ["t"] = {"test", "tool"},
        ["te"] = {"test"},
        ["tes"] = {"test"},
        ["to"] = {"tool"},
        ["too"] = {"tool"},

        ["v"] = {"version", "vet"},
        ["ve"] = {"version", "vet"},
        ["ver"] = {"version"},
        ["vers"] = {"version"},
        ["versi"] = {"version"},
        ["versio"] = {"version"},

        ["default"] = {
          "bug",
          "build",
          "clean",
          "doc",
          "env",
          "fix",
          "fmt",
          "generate",
          "get",
          "install",
          "list",
          "mod",
          "work",
          "run",
          "test",
          "tool",
          "version",
          "vet",
        },
      }
      if CmdLine == "Go generate " or  CmdLine == "Go fmt " then
        return {"./..."}
      elseif CursorPos > 3 then
        return choices[ArgLead]
      else
        return choices["default"]
      end
  end,
  })

create_cmd("Zig", function (opt)
  local fmt = "zig "
  for _, cmd in ipairs(opt.fargs) do
    fmt = fmt .. cmd .. " "
  end
  vim.cmd("!"..fmt)
end,{
    nargs = '+',
    complete = function(ArgLead, CmdLine, CursorPos)
      local choices = {
        ["defualt"] = {
          "build",
          "init-exe",
          "init-lib",
          "init-obj",
          "fmt",
          "run",
          "test",
          "translate-c",

          "ar",
          "cc",
          "c++",
          "dlltool",
          "lib",
          "ranlib",
          "objcopy",

          "env",
          "help",
          "libc",
          "targets",
          "version",
          "zen",
        }
      }
        return choices["default"]

    end,
  })
