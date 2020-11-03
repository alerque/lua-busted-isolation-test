-- This will fail because Busted loads 'pl.utils' for it's own use first. It's
-- not loaded in the automatically isolated describe() function scope, but when
-- you do load it you get the *previously loaded one* not the one that would
-- load in the current first-win packages.path!
describe("pl.utils", function ()
  local utils = require("pl.utils")
  it("should be the local dummp module not the system Penlight", function()
    assert.is_nil(utils._VERSION)
    assert.truthy(utils.i_am_local)
  end)
end)

-- This nearly identical test will pass because Busted doesn't happen to load
-- 'pl.sip', so when this gets tested a fresh load using the current scope's
-- package.path finds the correct module.
describe("pl.sip", function ()
  local sip = require("pl.sip")
  it("should be the local dummp module not the system Penlight", function()
    assert.is_nil(sip._VERSION)
    assert.truthy(sip.i_am_local)
  end)
end)
