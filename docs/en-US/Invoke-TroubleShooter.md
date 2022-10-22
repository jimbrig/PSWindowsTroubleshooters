---
external help file: PSWindowsTroubleshooters-help.xml
Module Name: PSWindowsTroubleshooters
online version:
schema: 2.0.0
---

# Invoke-TroubleShooter

## SYNOPSIS
Invoke-TroubleShooter is a function that runs troubleshooters on the local machine.

## SYNTAX

```
Invoke-TroubleShooter [-Name] <String> [-AsAdmin] [<CommonParameters>]
```

## DESCRIPTION
Invoke-TroubleShooter is a function that runs troubleshooters on the local machine.

## EXAMPLES

### EXAMPLE 1
```
Invoke-TroubleShooter -Name WindowsUpdateDiagnostic -AsAdmin
```

Will invoke the Windows Update Diagnostic troubleshooter as Administrator.

## PARAMETERS

### -Name
The name of the troubleshooter to run.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AsAdmin
Run the troubleshooter as an administrator?

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
