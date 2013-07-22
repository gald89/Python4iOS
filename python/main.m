//
//  main.m
//  python
//
//  Created by YANG HONGBO on 2013-7-18.
//  Copyright (c) 2013年 YANG HONGBO. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

#import <Python.h>
#import "pythonmodules.h"
#import "twisted.h"
#import "zope_interface.h"

void init_python();

void init_python()
{
    NSString * name = [[NSBundle mainBundle] bundleIdentifier];
    Py_SetProgramName((char *)[name cStringUsingEncoding:NSUTF8StringEncoding]);
    NSString * rootPath = [[NSBundle mainBundle] resourcePath];
    Py_SetPythonHome((char *)[rootPath cStringUsingEncoding:NSUTF8StringEncoding]);
    Py_OptimizeFlag = 1;
    Py_Initialize();
//    PyRun_SimpleString("import sys\n"
//                       "del sys.path[0]\n"
//                       "sys.path.append('')\n");
//    initselect(); //unsupported on iOS ?
    init_struct();
    init_io();
    init_functools();
    inittime();
    init_socket();
    initsendmsg();
    initraiser();
    init_zope_interface_coptimizations();
}


int main(int argc, char *argv[])
{
    @autoreleasepool {
        init_python();
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
