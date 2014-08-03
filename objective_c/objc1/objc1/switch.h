//
//  switch.h
//  objc1
//
//  Created by 海野 秀祐 on 2014/08/02.
//  Copyright (c) 2014年 B02681. All rights reserved.
//

#ifndef objc1_switch_h
#define objc1_switch_h

// ライフサイクル系のメソッドのログをコンソールに出力する
#define DISP_LIFE_CYCLE		(TRUE)


#if DISP_LIFE_CYCLE
#define	LCLOG(str) NSLog(str)
#else
#define LCLOG(str)
#endif

#endif
