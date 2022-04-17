local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character
local Mouse = Player:GetMouse()

local Align = function(Part0, Part1, Mesh)
    if string.lower(Part0.Name) == "handle" then
        Part0:BreakJoints()
        
        if Mesh == true then
            for _,Instance in pairs(Part0:GetChildren()) do
                if Instance.Name == "SpecialMesh" then
                    Instance:Destroy()
                end
                
                if Instance.Name == "Mesh" then
                    Instance:Destroy()
                end
            end
        end
    end
    
    local Aligns = {
        AlignOrientation = Instance.new("AlignOrientation", Part0),
        AlignPosition = Instance.new("AlignPosition", Part0)
    }
    
    local Attachments = {
        Attach0 = Instance.new("Attachment", Part0),
        Attach1 = Instance.new("Attachment", Part1)
    }
    
    Aligns.AlignOrientation.Attachment0 = Attachments.Attach0
    Aligns.AlignOrientation.Attachment1 = Attachments.Attach1
    Aligns.AlignOrientation.Responsiveness = 2000
    Aligns.AlignOrientation.RigidityEnabled = true
    
    Aligns.AlignPosition.Attachment0 = Attachments.Attach0
    Aligns.AlignPosition.Attachment1 = Attachments.Attach1
    Aligns.AlignPosition.Responsiveness = 2000
    Aligns.AlignPosition.RigidityEnabled = true
    
    game:GetService("RunService").Heartbeat:Connect(function()
        Part0.Velocity = Vector3.new(0, 35, 0)
    end)

    return {Attachments.Attach0, Attachments, Aligns}
end

local Hat = Align(Character["Hat Name"].Handle, Character["Torso"], true)
Hat[1].Position = Vector3.new(0, 0, 0)
Hat[1].Orientation = Vector3.new(0, 0, 0)

-- [[ (Hat, Part, Mesh) # If true then no mesh if false then mesh ]]
