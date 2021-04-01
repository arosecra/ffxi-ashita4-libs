# ffxi-ashita4-libs2
Libraries used in other personal addons


## Macros
Macros provides facilities to read and execute commands
defined in an INI file (config/macros/macros.ini).

Macros have each have the following form:

${macroid}.${property}

| Property | Description | 
| -------- | ----------- |
| name     | The displayed name of the command |
| command  | Optional. The command to queue |
| cycle    | Optional, not useful in all contexts. Used to cycle a job setting |
| script   | Optional, the script to execute |
| send_to  | Optional. Command sent to another character with MS |
| send_target | Optional. If true, the target is sent with the command |
| spacer   | Optional. If present, this isn't a macro, just a place holder |


## Packets

Parsers for several packets.

| Packet | Id   |
| Action | 0x28 |
| PC Update | 0x0D |
| Status Effect | 0x76 |


## Bits
Temporary work around. Contains a function derived from the Ashita CPP BinaryData header file.

## Config
Method to convert INI values into tables.

## ImGui
Methods to apply common styling to other addons.

## Jobs
A table of the job names.  Modified so there are no whitespaces for INI files.

## Mechanics
Methods related to ffxi mechanics.