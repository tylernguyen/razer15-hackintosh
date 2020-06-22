// Disable TPD0
DefinitionBlock ("", "SSDT", 2, "tyler", "GPI0", 0x00000000)
{
    External (GPHD, FieldUnitObj)

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            GPHD = 0x02
        }
    }
}

