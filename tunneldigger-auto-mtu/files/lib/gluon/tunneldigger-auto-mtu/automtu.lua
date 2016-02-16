#!/usr/bin/lua
local uci = require('luci.model.uci').cursor()

local td_mtu_low = '1312'
local td_mtu_high = '1426'
local DSL_mtu_high = '1492' - '28'

local result = td_mtu_low
local mtu

if not (uci:get('tunneldigger','@broker[0]','enabled') == '1') then
  os.execute('logger automtu: mesh_vpn not enabled.')
  os.exit()
end

if not (uci:get('tunneldigger','@broker[0]','auto_mtu_enabled') == '1') then
  os.execute('logger automtu: automtu not enabled.')
  os.exit()
end


function setMTU ( x )
  os.execute('logger automtu: tunneldigger MTU changed')
  os.execute('logger automtu: restart tunneldigger')
  print('tunneldigger MTU changed')
  print('restart tunneldigger...')
  uci:set('network', 'mesh_vpn', 'mtu', x)
  uci:save('network')
  uci:commit('network')
  os.execute('/etc/init.d/tunneldigger restart')
  return x
end

local f = io.popen("/usr/bin/ping -M do -s " ..DSL_mtu_high.. " -c 5 8.8.8.8")
local o = f:read('*all')
f:close()

if o:find('5 packets transmitted') then
  if not o:find('100%% packet loss') then
    result=td_mtu_high
   end
end

mtu = uci:get('network', 'mesh_vpn', 'mtu')

if result == td_mtu_high then
  if not (mtu == td_mtu_high) then
    mtu = setMTU (td_mtu_high)
  end
else
  if not (mtu == td_mtu_low) then
    mtu = setMTU (td_mtu_low)
  end
end

print ('tunneldigger MTU = ' .. mtu .. ' Byte')
os.execute('logger automtu: tunneldigger MTU = ' .. mtu .. ' Byte')

