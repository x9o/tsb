

local UseSkill = function(skill)
    game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack({[1] = {["Goal"] = "Console Move", ["Tool"] = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(skill)}}))
end


local Dash = function(direction)
    if direction == "W" then
        game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack({[1] = {["Dash"] = Enum.KeyCode.W, ["Key"] = Enum.KeyCode.Q, ["Goal"] = "KeyPress"}}))
    elseif direction == "A" then
        game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack({[1] = {["Dash"] = Enum.KeyCode.A, ["Key"] = Enum.KeyCode.Q, ["Goal"] = "KeyPress"}}))  
    elseif direction == "S" then
        game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack({[1] = {["Dash"] = Enum.KeyCode.S, ["Key"] = Enum.KeyCode.Q, ["Goal"] = "KeyPress"}}))
    elseif direction == "D" then
        game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack({[1] = {["Dash"] = Enum.KeyCode.D, ["Key"] = Enum.KeyCode.Q, ["Goal"] = "KeyPress"}}))
    end
end

--Front dash

function Walk(amount)
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    local humanoid = game:GetService("Players").LocalPlayer.Character.Humanoid

    local forwardDirection = character.HumanoidRootPart.CFrame.LookVector


    local newPosition = character.HumanoidRootPart.Position + (forwardDirection * amount)


    humanoid:MoveTo(newPosition)

    while (character.HumanoidRootPart.Position - newPosition).Magnitude > 0.5 do
        task.wait()
    end
end

function HorizontalCamera(humanoid, distance)
    -- Perfect right: distance = 45
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local camera = workspace.CurrentCamera


    local humanoidCFrame = humanoid.RootPart.CFrame

    local cameraPosition = humanoidCFrame * CFrame.new(distance, 0, 0)

    camera.CFrame = CFrame.new(cameraPosition.Position, humanoidCFrame.Position)
end



-- Side dash

local M1 = function()
    game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack({[1] = {["Mobile"] = true, ["Goal"] = "LeftClick"}}))
    game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack({[1] = {["Goal"] = "LeftClickRelease", ["Mobile"] = true}}))
end


-- M1

local Block = function()
    game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack({[1] = {["Goal"] = "KeyPress", ["Key"] = Enum.KeyCode.F}}))
end
-- Block

local Jump = function()
    game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end



local Downslam = function()
    for i = 1, 5 do
        M1()
        wait(0.2)
    end
    wait(0.3) 

    Jump()
    wait(0.3)
    M1()
end


local Uppercut = function()
    for i = 1, 5 do
        M1()
        wait(0.2)
    end
    wait(0.3)

    game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack({[1] = {["Goal"] = "KeyPress", ["Key"] = Enum.KeyCode.Space}}))
    M1()
end



local Combo = function()
    Downslam()
    wait(0.2)
    UseSkill("Hunter's Grasp")
    wait(1)
    Dash("W")
    wait(0.6)
    Uppercut()
    wait(0.4)
    UseSkill("Flowing Water")
    wait(0.8)
    HorizontalCamera(game:GetService("Players").LocalPlayer.Character.Humanoid, 45)
    task.spawn(Walk, 5)
    task.spawn(Dash, "D")
    wait(0.4)
    Downslam()
    wait(0.2)
    UseSkill("Hunter's Grasp")
end


Combo()
