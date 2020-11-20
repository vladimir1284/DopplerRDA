
using System;
using System.Runtime.InteropServices;
using Advantech.Adam;
using Advantech.Common;

namespace ModBusLibrary1
{
    [ComVisible(true)]
    [ClassInterface(ClassInterfaceType.None)]
    [ComDefaultInterface(typeof(IModLib))]
    [Guid("E8D53EED-3B2F-45A8-BB29-CC111BB426D1")]
    public class ModLib : IModLib
    {
        private AdamCom adamCom;
        private int m_iCom, m_iAddr, m_iCount;
        private int m_iStart, m_iLength;
        private bool m_bRegister, m_bStart;

        public double Sumar(int a, int b)
        {
            return a + b;
        }


        public int ConfMod(int iCom, int iAddr, int iStart, int iLength, bool bRegister)
        {
            //int iIdx, iPos, iStart;

            m_bRegister = bRegister; // set to true to read the register, otherwise, read the coil
            m_iCom = iCom;			// host COM port number
            m_iAddr = iAddr;		// modbus slave address
            m_iStart = iStart;		// modbus starting address
            m_iLength = iLength;		// modbus reading length
            adamCom = new AdamCom(m_iCom);
            if (m_bRegister)
            {
                return 1;
            }

            return 0;
        }


        public bool WriteBit(int module, int bit, bool state)
        {
            if (adamCom.Modbus(module).ForceSingleCoil(bit, state))
            {
                return true;
            }
            else
            {
                return false;
            }

        }


        public bool WriteCode(int module, int channel, int code)
        {
            if (adamCom.Modbus(module).PresetSingleReg(channel,code))
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public int OpenComPort() 
        {

            if (adamCom.OpenComPort())
            {
                // set COM port state
                adamCom.SetComPortState(Baudrate.Baud_38400, Databits.Eight, Parity.None, Stopbits.One);
                // set COM port timeout
                adamCom.SetComPortTimeout(500, 500, 0, 500, 0);
                m_iCount = 0; // reset the reading counter
                m_bStart = true; // starting flag
                return 1;
            }
            else
                return 1000;
        
        }

        public int[] DataGet() 
        {
                    
                    int[] iData;


                    if (m_bRegister) // Read registers (4X references)
                    {
                        // read register (4X) data from slave
                        if (adamCom.Modbus(m_iAddr).ReadHoldingRegs(m_iStart, m_iLength, out iData))
                        {
                            m_iCount++; // increment the reading counter


                            return iData; // show value in decimal


                        }
                        else
                        {

                            iData = new int[1];
                            iData[0] = 1000;
                            return iData;

                        }

                    }
                    else
                    {

                        iData = new int[1];
                        iData[0] = 1500;
                        return iData;

                    }
                   

                          
                   
        
        }

    }

    [ComVisible(true)]
    [Guid("97D1968E-DC7F-45BD-BD0E-1AC822D95264")]
    public interface IModLib
    {
        double Sumar(int a, int b);
        int ConfMod(int iCom, int iAddr, int iStart, int iLength, bool bRegister);
        bool WriteBit(int module, int bit, bool state);
        bool WriteCode(int module, int channel, int code);
        int OpenComPort();
        int[] DataGet();
    }
}
