/****** ConfigMgr Systems With Pending Reboot  ******/
SELECT [Name]
      ,[ClientState]
	  ,"Pending Reboot"=
	  case [ClientState]
when '1' then 'Configuration Manager'
when '2' then 'File Rename'
when '3' then 'Configuration Manager, File Rename'
when '4' then 'Windows Update'
when '5' then 'Configuration Manager, Windows Update'
when '6' then 'File Rename, Windows Update'
when '7' then 'Configuration Manager, File Rename, Windows Update'
when '8' then 'Add or Remove Feature'
when '9' then 'Configuration Manager, Add or Remove Feature'
when '10' then 'File Rename, Add or Remove Feature'
when '11' then 'Configuration Manager, File Rename, Add or Remove Feature'
when '12' then 'Windows Update, Add or Remove Feature'
when '13' then 'Configuration Manager, Windows Update, Add or Remove Feature'
when '14' then 'File Rename, Windows Update, Add or Remove Feature' 
when '15' then 'Configuration Manager, File Rename, Windows Update, Add or Remove Feature'
else 'Unknown'
end
  FROM [v_CombinedDeviceResources]
  where ClientState <> '0'
  order by Name


/****** Count ConfigMgr Systems With Pending Reboot  ******/
SELECT "Pending Reboot"=
	  case [ClientState]
when '1' then 'Configuration Manager'
when '2' then 'File Rename'
when '3' then 'Configuration Manager, File Rename'
when '4' then 'Windows Update'
when '5' then 'Configuration Manager, Windows Update'
when '6' then 'File Rename, Windows Update'
when '7' then 'Configuration Manager, File Rename, Windows Update'
when '8' then 'Add or Remove Feature'
when '9' then 'Configuration Manager, Add or Remove Feature'
when '10' then 'File Rename, Add or Remove Feature'
when '11' then 'Configuration Manager, File Rename, Add or Remove Feature'
when '12' then 'Windows Update, Add or Remove Feature'
when '13' then 'Configuration Manager, Windows Update, Add or Remove Feature'
when '14' then 'File Rename, Windows Update, Add or Remove Feature' 
when '15' then 'Configuration Manager, File Rename, Windows Update, Add or Remove Feature'
else 'Unknown'
end, [ClientState], count(*)
  FROM [CM_1IS].[dbo].[v_CombinedDeviceResources]
  where ClientState <> '0'
  group by [ClientState]
  order by [ClientState]