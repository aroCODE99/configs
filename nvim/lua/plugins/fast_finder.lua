return {
  "camspiers/snap",
  config = function ()
    -- Basic example config
    local snap = require"snap"
    snap.maps{
        { "<Leader>fs", snap.config.file { producer = "ripgrep.file" } },
        {"<Leader>fg", snap.config.vimgrep {}},
    }
  end
}
