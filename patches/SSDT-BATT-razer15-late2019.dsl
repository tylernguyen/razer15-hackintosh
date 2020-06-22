DefinitionBlock ("", "SSDT", 2, "tyler", "BATT", 0x00000000)
{
    External (_SB_.PCI0.LPCB.BAT0, DeviceObj)
    External (_SB_.PCI0.LPCB.BAT0.BFB0, PkgObj)
    External (_SB_.PCI0.LPCB.BAT0.BFB1, PkgObj)
    External (_SB_.PCI0.LPCB.BAT0.PAK1, PkgObj)
    External (_SB_.PCI0.LPCB.BAT0.PAK2, PkgObj)
    External (_SB_.PCI0.LPCB.BAT0.XBIF, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.BAT0.XBST, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC0_, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0_.ECON, IntObj)
    External (_SB_.PCI0.LPCB.EC0_.PSTA, FieldUnitObj)
    External (BFB0, IntObj)
    External (BFB1, IntObj)
    External (PAK1, IntObj)
    External (PAK2, IntObj)

    Method (B1B2, 2, NotSerialized)
    {
        Return ((Arg0 | (Arg1 << 0x08)))
    }

    Method (B1B4, 4, NotSerialized)
    {
        Local0 = (Arg2 | (Arg3 << 0x08))
        Local0 = (Arg1 | (Local0 << 0x08))
        Local0 = (Arg0 | (Local0 << 0x08))
        Return (Local0)
    }

    Method (W16B, 3, NotSerialized)
    {
        Arg0 = Arg2
        Arg1 = (Arg2 >> 0x08)
    }

    Scope (_SB.PCI0.LPCB.EC0)
    {
        Method (RE1B, 1, NotSerialized)
        {
            OperationRegion (ERM2, EmbeddedControl, Arg0, One)
            Field (ERM2, ByteAcc, NoLock, Preserve)
            {
                BYTE,   8
            }

            Return (BYTE) /* \_SB_.PCI0.LPCB.EC0_.RE1B.BYTE */
        }

        Method (RECB, 2, Serialized)
        {
            Arg1 = ((Arg1 + 0x07) >> 0x03)
            Name (TEMP, Buffer (Arg1){})
            Arg1 += Arg0
            Local0 = Zero
            While ((Arg0 < Arg1))
            {
                TEMP [Local0] = RE1B (Arg0)
                Arg0++
                Local0++
            }

            Return (TEMP) /* \_SB_.PCI0.LPCB.EC0_.RECB.TEMP */
        }

        Method (WE1B, 2, NotSerialized)
        {
            OperationRegion (ERM2, EmbeddedControl, Arg0, One)
            Field (ERM2, ByteAcc, NoLock, Preserve)
            {
                BYTE,   8
            }

            BYTE = Arg1
        }

        Method (WECB, 3, Serialized)
        {
            Arg1 = ((Arg1 + 0x07) >> 0x03)
            Name (TEMP, Buffer (Arg1){})
            TEMP = Arg2
            Arg1 += Arg0
            Local0 = Zero
            While ((Arg0 < Arg1))
            {
                WE1B (Arg0, DerefOf (TEMP [Local0]))
                Arg0++
                Local0++
            }
        }

        OperationRegion (ERAX, EmbeddedControl, Zero, 0xFF)
        Field (ERAX, ByteAcc, NoLock, Preserve)
        {
            Offset (0x92), 
            IF00,   8, 
            IF01,   8, 
            IF02,   8, 
            IF03,   8, 
            IF04,   8, 
            IF05,   8, 
            IF06,   8, 
            IF07,   8, 
            Offset (0xA2), 
            IF08,   8, 
            IF09,   8, 
            AF00,   8, 
            AF01,   8, 
            AF02,   8, 
            AF03,   8, 
            AF04,   8, 
            AF05,   8
        }
    }

    Scope (_SB.PCI0.LPCB.BAT0)
    {
        Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
        {
            If (_OSI ("Darwin"))
            {
                If ((^^EC0.ECON == One))
                {
                    PAK1 [One] = B1B2 (^^EC0.IF00, ^^EC0.IF01)
                    PAK1 [0x02] = B1B2 (^^EC0.IF02, ^^EC0.IF03)
                    PAK1 [0x03] = B1B2 (^^EC0.IF04, ^^EC0.IF05)
                    PAK1 [0x04] = B1B2 (^^EC0.IF06, ^^EC0.IF07)
                    PAK1 [0x05] = (B1B2 (^^EC0.IF00, ^^EC0.IF01) / 0x32)
                    PAK1 [0x06] = (B1B2 (^^EC0.IF00, ^^EC0.IF01) / 0x64)
                    Local0 = ^^EC0.PSTA /* External reference */
                    Local0 &= 0x83
                    If ((Local0 == 0x82))
                    {
                        Return (PAK1) /* External reference */
                    }

                    If ((Local0 == 0x83))
                    {
                        Return (PAK1) /* External reference */
                    }

                    If ((Local0 == 0x81))
                    {
                        Return (PAK2) /* External reference */
                    }

                    Return (PAK2) /* External reference */
                }
                Else
                {
                    Return (PAK2) /* External reference */
                }

                Return (PAK2) /* External reference */
            }
            Else
            {
                Return (XBIF ())
            }
        }

        Method (_BST, 0, NotSerialized)  // _BST: Battery Status
        {
            If (_OSI ("Darwin"))
            {
                If ((^^EC0.ECON == One))
                {
                    BFB0 [Zero] = B1B2 (^^EC0.IF08, ^^EC0.IF09)
                    BFB0 [One] = B1B2 (^^EC0.AF00, ^^EC0.AF01)
                    BFB0 [0x02] = B1B2 (^^EC0.AF02, ^^EC0.AF03)
                    BFB0 [0x03] = B1B2 (^^EC0.AF04, ^^EC0.AF05)
                    Local0 = ^^EC0.PSTA /* External reference */
                    Local0 &= 0x83
                    If ((Local0 == 0x82))
                    {
                        Return (BFB0) /* External reference */
                    }

                    If ((Local0 == 0x83))
                    {
                        Return (BFB0) /* External reference */
                    }

                    If ((Local0 == 0x81))
                    {
                        Return (BFB1) /* External reference */
                    }

                    Return (BFB1) /* External reference */
                }
                Else
                {
                    Return (BFB1) /* External reference */
                }
            }
            Else
            {
                Return (XBST ())
            }
        }
    }
}

