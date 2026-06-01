#ifndef IFLOOR_STDWX_H_
#define IFLOOR_STDWX_H_

#define WIN32_LEAN_AND_MEAN
#define NOMINMAX

#ifdef _WIN32
#define PLUGIN_EXPORTED_API __declspec(dllexport)
#else
#define PLUGIN_EXPORTED_API extern "C"
#endif

// wxWidgets core
#include "wx/wxprec.h"

#ifndef WX_PRECOMP
#include "wx/wx.h"
#endif

#include <wx/cmdline.h> 
#include <wx/config.h>
#include <wx/defs.h>
#include <wx/dir.h>
#include <wx/display.h>
#include <wx/dynlib.h> 
#include <wx/dynload.h>
#include <wx/fileconf.h>
#include <wx/filename.h>
#include <wx/frame.h>
#include <wx/glcanvas.h>
#include <wx/hashmap.h>
#include <wx/image.h>
#include <wx/imaglist.h>
#include <wx/intl.h>
#include <wx/list.h> 
#include <wx/notebook.h>
#include <wx/stdpaths.h>
#include <wx/sstream.h>
#include <wx/thread.h>
#include <wx/treebook.h>
#include <wx/wfstream.h>
#include <wx/wupdlock.h>
#include <wx/textfile.h>
#include <wx/socket.h>
#include <wx/mimetype.h>
#include <wx/ipc.h>

#endif // IFLOOR_STDWX_H_