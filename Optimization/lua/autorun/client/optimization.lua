

if CLIENT then

function Optimization()

local FR = vgui.Create( "DFrame" ) 
--FR:SetTitle("   O p t i m i z a t i o n") 
FR:SetTitle( "" )
FR:MakePopup()
FR:SetDraggable( false )
FR:SetSize( 500, 250 )
FR:ShowCloseButton( false )
--FR:SetBackgroundBlur(true) 
FR:Center()
FR.Paint = function( self, w, h )
	draw.RoundedBox( 2, 0, 0, w, h, Color( 0, 0, 255, 180 ) )
	draw.RoundedBox( 2, 0, 25, w, h, Color( 255, 255, 255, 180) )
end

FR.lblTitle.UpdateColours = function( label, skin )
     label:SetTextStyleColor( Color( 255, 255, 255, 200 ) )
end

local NA = vgui.Create( "DLabel", FR ) 
NA:SetText( "                          О п т и м и з а ц и я" ) 
NA:SetTextColor( Color( 255, 255, 255 ) )
NA:SetFont( "Trebuchet24" ) -- Font
NA:SetPos( 0, 0 )
NA:SetSize( 500, 25 )

--[[local CL = vgui.Create( "DButton", FR )   
CL:SetText( "x" )
CL:SetFont( "Trebuchet18" )
CL:SetColor( Color( 255, 255, 255, 180 ) )
CL:SetPos( 444, 0 )
CL:SetSize( 56, 26 )
CL.DoClick = function()
	FR:Remove()
end

CL.Paint = function( self, w, h )
	--draw.RoundedBox( 2, 0, 0, w, h, Color( 0, 0, 255, 180 ) )
end]]--

local TX = vgui.Create( "DLabel", FR ) 
TX:SetFont( "Trebuchet24" )
TX:SetText( "\n\n                    Optimization On/OFF?\n\n                
TX:SetSize( 500, 120 )
TX:SetColor( Color( 0, 0, 255, 200 ) )
TX:SetPos( 10, 10 )

local YES = vgui.Create( "DButton", FR ) 
YES:SetText( "Да" )
YES:SetFont( "DermaLarge" )
YES:SetPos( 60, 160 )
YES:SetSize( 130, 50 )
YES.Paint = function( self, w, h )
	--draw.RoundedBox( 2, 0, 0, w, h, Color( 0, 0, 255, 180 ) )
	--draw.RoundedBox( 2, 2, 2, w-4, h-4, Color( 255, 255, 255, 180 ) )
if YES.Depressed or YES.m_bSelected then

draw.RoundedBox( 2, -2, -2, w+4, h+4, Color( 0, 205, 0, 255 ) )
YES:SetTextColor( Color( 255, 255, 255, 230 ) )

elseif YES.Hovered then

draw.RoundedBox( 2, -2, -2, w+4, h+4, Color( 0, 235, 0, 255 ) )

YES:SetTextColor( Color( 255, 255, 255, 230 ) )
else

draw.RoundedBox( 2, 0, 0, w, h, Color( 0, 0, 255, 180 ) )
draw.RoundedBox( 2, 2, 2, w-4, h-4, Color( 255, 255, 255, 180 ) )
YES:SetTextColor( Color( 0, 0, 0, 230 ) )
end

YES.DoClick = function()

	surface.PlaySound( "buttons/button15.wav" )

	LocalPlayer():ConCommand( "cl_threaded_client_leaf_system 1" )

	LocalPlayer():ConCommand( "mat_queue_mode -1" )

	LocalPlayer():ConCommand( "cl_threaded_bone_setup 1" )

	LocalPlayer():ConCommand( "gmod_mcore_test 1" )

	--LocalPlayer():ConCommand( "r_threaded_client_shadow_manager 1" )

	--LocalPlayer():ConCommand( "r_queued_post_processing 1" )

	LocalPlayer():ConCommand( "r_threaded_renderables 1" )

	LocalPlayer():ConCommand( "r_threaded_particles 1" )

	LocalPlayer():ConCommand( "r_queued_ropes 1" )

	LocalPlayer():ConCommand( "studio_queue_mode 1" )

	FR:Remove()
end

surface.SetDrawColor( Color( 255, 255, 255 ) )
end

local NO = vgui.Create( "DButton", FR ) 
NO:SetText( "Нет" )
NO:SetFont( "DermaLarge" )
NO:SetPos( 310, 160 )
NO:SetSize( 130, 50 )
NO.Paint = function( self, w, h )
	--draw.RoundedBox( 2, 0, 0, w, h, Color( 0, 0, 255, 180 ) )
	--draw.RoundedBox( 2, 2, 2, w-4, h-4, Color( 255, 255, 255, 180 ) )
if NO.Depressed or NO.m_bSelected then

draw.RoundedBox( 2, -2, -2, w+4, h+4, Color( 235, 0, 0, 255 ) )
NO:SetTextColor( Color( 255, 255, 255, 230 ) )

elseif NO.Hovered then

draw.RoundedBox( 2, -2, -2, w+4, h+4, Color( 255, 0, 0, 255 ) )
NO:SetTextColor( Color( 255, 255, 255, 230 ) )

else

draw.RoundedBox( 2, 0, 0, w, h, Color( 0, 0, 255, 180 ) )
draw.RoundedBox( 2, 2, 2, w-4, h-4, Color(255, 255, 255, 180 ) )
NO:SetTextColor( Color( 0, 0, 0, 230 ) )
end

surface.SetDrawColor( Color( 255, 255, 255 ) )
end


NO.DoClick = function()

	FR:Remove()

	LocalPlayer():ConCommand( "gmod_mcore_test 0" )

	surface.PlaySound( "buttons/button15.wav" )
	end
end

hook.Add("InitPostEntity","LoadWhenJoin",function()
timer.Simple(7,function()
Optimization()
end)
end)

concommand.Add( "Optimization", Optimization ) -- 
end

