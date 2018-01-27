------------------------------------
-- SubconstructSequencer
-- (c) 2018 Torikame Autonomous Industry Co.Ltd.
------------------------------------

-- 設定ここから

-- ユニットの止まる位置
-- setting: この位置にするためのピストンやスピブロの設定値。unitsのpartsの数だけ指定する。
-- usage, entering, leaveing: nil固定
positions = {
  {setting = {0.0, 0.0}, usage = nil, entering = nil, leaving = nil},
  {setting = {2.0, 0.0}, usage = nil, entering = nil, leaving = nil},
  {setting = {4.0, 4.0}, usage = nil, entering = nil, leaving = nil},
  {setting = {2.0, 8.0}, usage = nil, entering = nil, leaving = nil},
  {setting = {0.0, 8.0}, usage = nil, entering = nil, leaving = nil},
  {setting = {0.0, 4.0}, usage = nil, entering = nil, leaving = nil},

  {setting = {0.0, 0.0}, usage = nil, entering = nil, leaving = nil},
  {setting = {2.0, 0.0}, usage = nil, entering = nil, leaving = nil},
  --{setting = {4.0, 4.0}, usage = nil, entering = nil, leaving = nil},
  {setting = {2.0, 8.0}, usage = nil, entering = nil, leaving = nil},
  {setting = {0.0, 8.0}, usage = nil, entering = nil, leaving = nil},
  {setting = {0.0, 4.0}, usage = nil, entering = nil, leaving = nil},
}

-- 一連の指示。コマンドの集合体
-- 複数系統設定できる
-- command: "move", "wait", "fire"のいずれかを指定する
-- positionId: 移動先のposition。"move"の時に指定する
-- speeds: 未使用
-- mainframe: 索敵に使うAIのインデックス。省略可。0以上の数字。省略時または-1は指定なし。"fire"の時に指定する
-- seconds: 待ち秒数。"wait"の時に指定する。
-- enterCondition: このコマンドを実行するための条件。ANDで複数指定可。
--   "empty": positionIdで指定した位置に他のunitが無ければ実行する
--   "leave": positionIdで指定した位置から他のunitが移動し始めたら実行する
--  ex.) {{"empty"}}  　 positionIdで指定した位置に他のunitが無ければ実行する
--  ex.) {{"empty", 1}}  positionsの1番目の位置に他のunitが無ければ実行する
--  ex.) {{"empty", 1}, {"empty", 2}}  positionsの1番目と2番目の位置に他のunitが無ければ実行する
sequences = {
  { -- sequenceId = 1
    {command = "move", positionId = 1, speeds = {2.0, 2.0}, enterCondition = {{"empty"}}},
    {command = "move", positionId = 2, speeds = {2.0, 2.0}, enterCondition = {{"empty"}}},
    {command = "move", positionId = 3, speeds = {2.0, 2.0}, enterCondition = {{"leave"}}},
    {command = "fire", positionId = 3, mainframe = -1},
    {command = "wait", positionId = 3, seconds = 1},
    {command = "move", positionId = 4, speeds = {2.0, 2.0}, enterCondition = {{"empty"}}},
    {command = "move", positionId = 5, speeds = {2.0, 2.0}, enterCondition = {{"empty"}}},
    {command = "move", positionId = 6, speeds = {2.0, 2.0}, enterCondition = {{"leave"}}},
  },
  { -- sequenceId = 2
    {command = "move", positionId = 7, speeds = {2.0, 2.0}, enterCondition = {{"empty"}}},
    {command = "move", positionId = 8, speeds = {2.0, 2.0}, enterCondition = {{"empty"}}},
    {command = "move", positionId = 3, speeds = {2.0, 2.0}, enterCondition = {{"leave"}}},
    {command = "fire", positionId = 3, mainframe = -1},
    {command = "wait", positionId = 3, seconds = 1},
    {command = "move", positionId = 9, speeds = {2.0, 2.0}, enterCondition = {{"empty"}}},
    {command = "move", positionId = 10, speeds = {2.0, 2.0}, enterCondition = {{"empty"}}},
    {command = "move", positionId = 11, speeds = {2.0, 2.0}, enterCondition = {{"leave"}}},
  }
}

-- シーケンスを実行するユニット。ピストンやスピブロの集合体
-- sequenceId: 私用するシーケンス。複数指定可。
--   ex.) sequenceId = {1} sequencesの1番目のシーケンスを実行する
--   ex.) sequenceId = {1,2} sequencesの1番目のシーケンスを実行し、次に2番目を実行する
-- default: 初期化で実行するコマンド。{シーケンスインデックス, コマンド番号} で指定する。
--   ex.) sequenceId = {1}, default = {1,2} sequencesの1番目のシーケンスの2番目のコマンドを実行する
--   ex.) sequenceId = {1,3}, default = {2,5} sequencesの3番目(sequenceIdの2個目)のシーケンスの5番目のコマンドを実行する
-- parts: ユニットを構成するピストンやスピブロを指定する
--   id: ピストンやスピブロのSubconstruct Id 
--   type: 0=ピストン、1=スピブロ
--   hasWeapon: true=武器が載っている、falseまたは省略=武器が載っていない
units = {
  {
    sequenceId = {1}, default = {1,1}, current = nil, next = nil, lastTime = nil, status = "",
    parts = {
      {id = 73, type = 0}, 
      {id = 74, type = 0, hasWeapon = true}
    }
  },
  {
    sequenceId = {1}, default = {1,2}, current = nil, next = nil, lastTime = nil, status = "",
    parts = {
      {id = 75, type = 0}, 
      {id = 76, type = 0, hasWeapon = true}
    }
  },
  {
    sequenceId = {1}, default = {1,5}, current = nil, next = nil, lastTime = nil, status = "",
    parts = {
      {id = 77, type = 0}, 
      {id = 78, type = 0, hasWeapon = true}
    }
  },
  {
    sequenceId = {1}, default = {1,6}, current = nil, next = nil, lastTime = nil, status = "",
    parts = {
      {id = 91, type = 0}, 
      {id = 92, type = 0, hasWeapon = true}
    }
  },
  {
    sequenceId = {2}, default = {1,1}, current = nil, next = nil, lastTime = nil, status = "",
    parts = {
      {id = 85, type = 0}, 
      {id = 86, type = 0, hasWeapon = true}
    }
  },
  {
    sequenceId = {2}, default = {1,2}, current = nil, next = nil, lastTime = nil, status = "",
    parts = {
      {id = 87, type = 0}, 
      {id = 88, type = 0, hasWeapon = true}
    }
  },
  {
    sequenceId = {2}, default = {1,5}, current = nil, next = nil, lastTime = nil, status = "",
    parts = {
      {id = 89, type = 0}, 
      {id = 90, type = 0, hasWeapon = true}
    }
  },
  {
    sequenceId = {2}, default = {1,6}, current = nil, next = nil, lastTime = nil, status = "",
    parts = {
      {id = 93, type = 0}, 
      {id = 94, type = 0, hasWeapon = true}
    }
  },

}
-- 設定ここまで

function GetTarget(I, mainframe)
  if mainframe == nil or mainframe == -1 then
    for mainframeIndex = 0, I:GetNumberOfMainframes() - 1, 1 do
      for targetIndex = 0, I:GetNumberOfTargets(mainframeIndex) - 1, 1 do
        local info = I:GetTargetPositionInfo(mainframeIndex, targetIndex)
        return info
      end
    end
  else
    for targetIndex = 0, I:GetNumberOfTargets(mainframeIndex) - 1, 1 do
      local info = I:GetTargetPositionInfo(mainframe, targetIndex)
      return info
    end
  end

  return Vector3(0,1,0)
end

function IsCompleted(I, unit, cmd)
  if cmd.command == "move" then
    for index = 1, table.maxn(unit.parts), 1 do
      local p = unit.parts[index]
      local position = positions[cmd.positionId]
      if p.type == 0 then
        local actualExtension = I:GetPistonExtension(p.id)
        if Mathf.Abs(position.setting[index] * 1000 - actualExtension * 1000) > 0.001 then
          return false
        else
        end
      end
    end
  elseif cmd.command == "wait" then
    if (I:GetTime() - unit.lastTime) < cmd.seconds then
      return false
    end
  elseif cmd.command == "fire" then
    local target = GetTarget(I, cmd.mainframe)
    for index = 1, table.maxn(unit.parts), 1 do
      local p = unit.parts[index]
      if p.hasWeapon == true then
        for weaponIndex = 0, I:GetWeaponCountOnSubConstruct(p.id) - 1, 1 do
          local info = I:GetWeaponInfoOnSubConstruct(p.id, weaponIndex)
          local aim = target - info.GlobalPosition
          if I:AimWeaponInDirectionOnSubConstruct(p.id, weaponIndex, aim.x, aim.y, aim.z, 0) == 0 then
            return false
          elseif I:FireWeaponOnSubConstruct(p.id, weaponIndex, 0) ~= true then
            return false
          end
        end
      end
    end
  end
  return true
end

function ExecuteCommand(I, unit, cmd, cur)
  if cmd.command == "move" then
    
    if cur ~= nil then
      local currentPosition = positions[cur.positionId]
      currentPosition.usage = nil
      currentPosition.leaving = unit
    end

    local position = positions[cmd.positionId]
    position.entering = unit
    for index = 1, table.maxn(unit.parts), 1 do
      local p = unit.parts[index]
      if p.type == 0 then
        -- piston
        I:SetPistonExtension(p.id, position.setting[index])
--        I:SetPistonVelocity(p.id, cmd.speeds[index])
      elseif p.type == 1 then
        -- spinblock
        I:SetSpinBlockRotationAngle(p.id, position.setting[index])
      end
    end
  elseif cmd.command == "wait" then
    unit.lastTime = I:GetTime()
  elseif cmd.command == "fire" then
    local target = GetTarget(I, cmd.mainframe)
    for index = 1, table.maxn(unit.parts), 1 do
      local p = unit.parts[index]
      if p.hasWeapon == true then
        for weaponIndex = 0, I:GetWeaponCountOnSubConstruct(p.id) - 1, 1 do
          local info = I:GetWeaponInfoOnSubConstruct(p.id, weaponIndex)
          local aim = target - info.GlobalPosition
          I:AimWeaponInDirectionOnSubConstruct(p.id, weaponIndex, aim.x, aim.y, aim.z, 0)
        end
      end
    end
  end
end

function CanExecute(I, unit, next)
  if next.command == "move" then
    for index = 1, table.maxn(next.enterCondition), 1 do
      local cond = next.enterCondition[index]
      local param = next.positionId
      if table.maxn(cond) > 1 then
        param = cond[2]
      end
      if cond[1] == "empty" then
        local position = positions[param]
        local ret = position.usage == nil and position.entering == nil and position.leaving == nil
        if ret == false then
          return false
        end
      elseif cond[1] == "leave" then
        local position = positions[param]
        local ret = position.usage == nil and position.entering == nil
        if ret == false then
          return false
        end
      end
    
    end
    end
  return true
end

function GetCommand(unit, command)
  return sequences[unit.sequenceId[command[1]]][command[2]]
end

function Work(I, unit, nextCommand, currentCommand)
  local seq = sequences[unit.sequenceId[nextCommand[1]]]
  local next = seq[nextCommand[2]]
  if IsCompleted(I, unit, next) then

    local currentPosition = nil
    if currentCommand ~= nil then
      local cur = GetCommand(unit, currentCommand)
      if cur.positionId ~= nil then
        currentPosition = positions[cur.positionId]
        currentPosition.leaving = nil
      end
    end

    if next.positionId ~= nil then
      local position = positions[next.positionId]
      position.usage = unit
      position.entering = nil
    end

    unit.status = "standby"
    unit.current = {nextCommand[1], nextCommand[2]}
    unit.next = {unit.current[1], unit.current[2] + 1}
    
    if unit.current[2] + 1 > table.maxn(seq) then
    
      if unit.next[2] > table.maxn(seq) then
        unit.next[2] = 1
        unit.next[1] = unit.next[1] + 1
        unit.current[1] = unit.current[1] + 1
      end
    
      if unit.next[1] > table.maxn(unit.sequenceId) then
        unit.next[1] = 1
      end
    
      if unit.current[1] > table.maxn(unit.sequenceId) then
        unit.current[1] = 1
      end
    end
  end
end

initialized = false

function Update(I)
  I:ClearLogs()

  if initialized == false then
    local allInited = true
    for index = 1, table.maxn(units), 1 do
      local unit = units[index]
      if unit.status ~= "standby" then
        allInited = false
        break
      end
    end
    if allInited then
      initialized = true
    end
  end

  for index = 1, table.maxn(units), 1 do
    local unit = units[index]

    if unit.status == "" then
      local seq = sequences[unit.sequenceId[unit.default[1]]]
      local cur = seq[unit.default[2]]
      ExecuteCommand(I, unit, cur, nil)
      unit.status = "initalizing"
    end

    if unit.status == "initalizing" then
      Work(I, unit, unit.default, nil)
    end

    if unit.status == "standby" and initialized then
      local seq = sequences[unit.sequenceId[unit.next[1]]]
      local next = seq[unit.next[2]]
      if CanExecute(I, unit, next) then
        local cur = GetCommand(unit, unit.current)
        ExecuteCommand(I, unit, next, cur)
        unit.status = "working"
      end
    end

    if unit.status == "working" then
      Work(I, unit, unit.next, unit.current)
    end

    -- debug logs
    if unit.current == nil then
      I:Log("unit".. index .. ", status=".. unit.status.. ", cur=nil")
    else
      I:Log("unit".. index .. ", status=".. unit.status.. ", cur="..unit.current[1] .. "|" .. unit.current[2].. ", next="..unit.next[1] .. "|" .. unit.next[2])
    end

  end

  -- debug logs
  for index = 1, table.maxn(positions), 1 do
    local position = positions[index]
    local msg = "position"..index
    if position.usage == nil then
      msg = msg..",usage=nil"
    else
      msg = msg..",usage="..position.usage.default[2]
    end

    if position.entering == nil then
      msg = msg..",entering=nil"
    else
      msg = msg..",entering="..position.entering.default[2]
    end

    if position.leaving == nil then
      msg = msg..",leaving=nil"
    else
      msg = msg..",leaving="..position.leaving.default[2]
    end
    I:Log(msg)
  end
  

end


