// hesl.h: interface for the hesl class.
//
//////////////////////////////////////////////////////////////////////

/*
       HUNT ENGINEERING Server/Loader
	   (c) 2003 HUNT ENGINEERING
	            all rights reserved

       version 4.16		(Aug 23, 2007)
*/

#if !defined(AFX_HESL_H__AA9EFA56_CCCE_11D7_9688_080000207595__INCLUDED_)
#define AFX_HESL_H__AA9EFA56_CCCE_11D7_9688_080000207595__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "heapi.h"

class network;
class ccif;

/* Return types for GetNodeType */
#define MOD_UNKNOWN		0
#define MOD_ROOT		1
#define MOD_NORMAL		2

/* Return tyes for GetNodeModType */
#define MOD_UNKNOWN		0
#define MOD_C4X			1
#define MOD_C6X			2
#define MOD_GDIO		3
#define MOD_HOST		4
#define MOD_EMC			5
#define MOD_EM1			6
#define MOD_EM2			7
#define MOD_FPGA		8

/* Some server functions (fwrite, fputs, fread, fgets) may be replaced by the */
/* user with a user-specific function. This may be useful in the case of non- */
/* dos-box programs. The mentioned server functions can be replaced for file  */
/* descriptors 'stdin', 'stdout' or 'stderr'. A user defined function will be */
/* given a parameter block, defined as follows:-                              */

struct server_function_parameters
{
	unsigned char	*buf;
	int				 blks;
	int				 elts;
	int				 Fd;
	char			 bdname[128];
	int				 bdno;
	int				 fifo;
};

typedef server_function_parameters SRVFIEPARAMS;

/* The user server functions must be defined as follows:-                     */
/* (Set the functions you defined using 'set_server_fie' as defined by class) */
typedef unsigned long (*USER_SRVFUNC)(const SRVFIEPARAMS *);

/* User server function types that can be used in 'set_server_fie' */
#define USER_SRV_FCLOSE		0xa0
#define USER_SRV_FREAD		0xa1
#define USER_SRV_FWRITE		0xa2
#define USER_SRV_FUNGETC	0xa3
#define USER_SRV_FGETS		0xa4
#define USER_SRV_FPUTS		0xa5
#define USER_SRV_FFLUSH		0xa6
#define USER_SRV_FSEEK		0xa7
#define USER_SRV_FTELL		0xa8
#define USER_SRV_FEOF		0xa9
#define USER_SRV_FERROR		0xaa

/* The user verbose function must be defined as follows:-                     */
/* (Set the function you defined using 'set_user_vprint' as defined by class) */
typedef void (*USER_VBSFUNC)(char *str);

class network;

class DllExport hesl  
{
public:
	hesl();
	virtual ~hesl();

	/* Version Information ---------------------------------- */
	void version     (int  *major  , int *minor, char **verstr);
	/* Last Error Information ------------------------------- */
	char *getlasterr (void);

	/* Server/Loader ---------------------------------------- */
	int  serverloader(HE_HANDLE *uDevice, int n, char *options, char *network);
	int  serverloader(HE_HANDLE *uDevice, int n, int   argc   , char *argv[] );
	int  serverloader(char *options, char *network);
	int  serverloader(int   argc   , char *argv[] );
	int  loader      (HE_HANDLE *uDevice, int n, char *options, char *network);
	int  loader      (HE_HANDLE *uDevice, int n, int   argc   , char *argv[] );
	int  loader      (char *options, char *network);
	int  loader      (int   argc   , char *argv[] );
	int  server      (void);
	int  terminate   (void);
	/* HeartConf -------------------------------------------- */
	int  heartconf   (HE_HANDLE *uDevice, int n, char *options, char *network);
	int  heartconf   (HE_HANDLE *uDevice, int n, int   argc   , char *argv[] );
	int  heartconf   (char *options, char *network);
	int  heartconf   (int   argc   , char *argv[] );

	/* Parse network file. Stand-alone utility. ------------- */
	int  parse_network_file(char *networkfile);

	/* User Verbose function -------------------------------- */
	void set_user_vprint(USER_VBSFUNC fie);

	/* User Server functions -------------------------------- */
	int  set_user_fie(USER_SRVFUNC fie, int whichfie);

	/* Information for API apps after HESL loading ---------- */
	/* Returns BD API information as in network file, first   */
	/* BD API is brdno 0, second BD API is brdno 1, and so on.*/

	/* Board Info */
	int   GetBoardCount      (void);
	int   GetBoardId         (char *dev, int bdsw, int  *bdid);
	int   GetBoardName       (int bdid, char *bdname);
	int   GetBoardSw         (int bdid, int  *bdsw);
	int   GetBoardFifo       (int bdid, int  *fifo);
	int   IsBoardRemote      (int bdid);
	int   GetBoardHsbAccessId(int bdid, int  *id);
	int   GetBoardRstAccessId(int bdid, int  *id);
	int   GetBoardHsbAccessSw(int bdid, char *dev, int *bdsw);
	int   GetBoardRstAccessSw(int bdid, char *dev, int *bdsw);

	/* Node Info */
	int   GetNodeCount       (void);
	int   GetNodeId          (char *dev , int   bdsw, int slot, int *nodeid);
	int   GetNodeModType     (int nodeid, int  *modtype);
	int   GetNodeBoardId     (int nodeid, int  *bdid);
	int   GetNodeBoardSw     (int nodeid, char *dev, int  *bdsw);
	int   GetNodeName        (int nodeid, char *nname);
	int   GetNodeType        (int nodeid, int  *ntype);
	int   GetNodeHeronId     (int nodeid, int  *heronid);
	int   GetNodeFile        (int nodeid, char *fname);
	int   GetNodeHsbAccessId (int nodeid, int  *bdid);
	int   GetNodeRstAccessId (int nodeid, int  *bdid);
	int   GetNodeHsbAccessSw (int nodeid, char *dev, int *bdsw);
	int   GetNodeRstAccessSw (int nodeid, char *dev, int *bdsw);

	/* Board connection info */
	int   FindIBCLink      (int fnode_id, int ffifo, int *tnode_id, int *tfifo);
	int   FindNodeConnCount(int fromid, int toid, int *count);
	int   FindNodeConn     (int fromid, int toid, int *from_fifo, int *to_fifo, int idx);

	/* If you use the Server part in parallel with an API thread, */
	/* you can ask the SL to flag when the Server part is ready   */
	/* to start serving. (Ie it has opened all boards that want   */
	/* to be served and all server threads have been started.)    */
	/* To do so, create a semaphore and tell the SL to flag that. */
#if _VXWORKS
	void FlagMeServerUp(SEM_ID s);
#else
#if _LINUX
	void FlagMeServerUp(sem_t *s);
#else
#if _RTOS32
	void FlagMeServerUp(RTKSemaphore s);
#else
	void FlagMeServerUp(HANDLE s);
#endif
#endif
#endif

protected:
	network *net;
//#ifdef CCSTUDIO
//	ccif    *cc;
//#endif
	char     errstr[1024];
};

#endif // !defined(AFX_HESL_H__AA9EFA56_CCCE_11D7_9688_080000207595__INCLUDED_)
