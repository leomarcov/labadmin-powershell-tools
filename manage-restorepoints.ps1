#Requires -RunAsAdministrator

#### PARAMETERS ##################################################
Param(
  [Switch]$Enable,           # Enable RPs
  [Switch]$Create,           # Create RP
  [Switch]$DeleteAll,        # Delete ALL restore points
  [Switch]$Restore           # Restore RP
  [Switch]$List              # List RPs
)


#### ACTION ENABLE ###############################################
if($enable) {
    Enable-ComputerRestore -Drive c:
    vssadmin resize shadowstorage /for=C: /on=C: /maxsize=5GB
}

#### ACTION CREATE ###############################################
if$($create) {
    Checkpoint-Computer -Description "labadmin-freezer-main"
}

#### ACTION DELETE ###############################################
if($deleteall) {
  vssadmin delete shadows /all
}

#### ACTION RESTORE ###############################################
if($restore) {
    Restore-Computer -RestorePoint 1
}

#### ACTION LIST ##################################################
if($LIST) {
   Get-ComputerRestorePoint
}