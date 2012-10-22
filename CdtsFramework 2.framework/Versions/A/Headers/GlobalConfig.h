//
//  GlobalConfig.h
//  CdtsFramework
//
//  Created by 山天 大畜 on 6/07/12.
//  Copyright (c) 2012 iSoftStone. All rights reserved.
//
#ifndef CDTS_GLOBAL_CONFIG
#define CDTS_GLOBAL_CONFIG

#ifdef CDTS_DEBUG
#define UADebugLog( s, ... ) NSLog( @"<%@:%d> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__,  [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define UADebugLog( s, ... ) 
#endif

#define SCREENHEIGHT 768
#define SCREENWIDTH 1024


#define IMG_UIMODALPANNEL_CLOSEBUTTON @"close.png"

#endif